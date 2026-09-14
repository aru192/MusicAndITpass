extends Node

var failures := 0
var checks := 0
var capture := false

func _ready() -> void:
	if OS.has_feature("web"):
		var start := Button.new()
		start.text = "Start automated QA (test data only)"
		start.position = Vector2(20, 100)
		start.size = Vector2(350, 100)
		add_child(start)
		start.pressed.connect(func():
			MusicManager.unlock()
			start.queue_free()
			_run.call_deferred())
	else:
		_run.call_deferred()

func check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures += 1
		push_error("TEST FAILED: " + message)

func _run() -> void:
	# Keep the runner alive across real scene transitions; isolate persisted data.
	get_tree().current_scene = null
	SaveManager.save_path = "user://qa-test-progress.cfg" if OS.has_feature("web") else "/tmp/itmusic-test-%d.cfg" % OS.get_process_id()
	SaveManager.records = {}
	capture = OS.get_cmdline_user_args().has("--capture")
	_test_data()
	_test_scoring()
	_test_save()
	_test_ring()
	_test_scheduler()
	_test_audio_chart()
	await _test_special_notes()
	await _test_board()
	await _test_editor_edits()
	await _test_layouts()
	await _test_flow()
	print("TEST RESULT: %d checks, %d failures" % [checks, failures])
	if OS.has_feature("web"):
		var banner := Label.new()
		banner.text = "QA: %d checks, %d failures" % [checks, failures]
		banner.add_theme_color_override("font_color", Color.BLACK)
		banner.add_theme_font_size_override("font_size", 20)
		var layer := CanvasLayer.new()
		layer.layer = 100
		add_child(layer)
		layer.add_child(banner)
	else:
		get_tree().quit(0 if failures == 0 else 1)

func _test_data() -> void:
	check(GameData.music_catalog.size() == 3, "three demo tracks")
	for song in GameData.music_catalog:
		check(ResourceLoader.exists(song.audio), "audio exists")
		check(ResourceLoader.exists(song.jacket), "jacket exists")
		var audio := load(str(song.audio)) as AudioStream
		check(absf(audio.get_length() - float(song.duration)) < 0.01, "metadata duration matches audio")
		check(song.difficulties.size() == 3, "three difficulties")
	var all_questions := QuizManager.questions()
	check(all_questions.size() == 70, "70 original questions")
	var ids: Array = []
	for question in all_questions:
		check(not ids.has(question.id), "question IDs unique")
		ids.append(question.id)
		check(question.choices.size() == 4 and int(question.answer) in range(4), "four valid answers")
		check(not str(question.explanation).is_empty(), "explanation present")
	for genre in QuizManager.genres() + ["all"]:
		var round_questions := QuizManager.make_round(genre)
		check(round_questions.size() == 10, "ten questions for " + genre)
		var seen: Array = []
		for question in round_questions:
			check(not seen.has(question.id), "no repeated questions per round")
			seen.append(question.id)
			var original: Dictionary = all_questions.filter(func(q: Dictionary): return q.id == question.id)[0]
			check(question.choices[int(question.answer)] == original.choices[int(original.answer)], "answer preserved after shuffle")

func _test_scoring() -> void:
	for pair in [[0.0, "PERFECT"], [0.08, "PERFECT"], [-0.08, "PERFECT"], [0.081, "GOOD"], [0.18, "GOOD"], [-0.18, "GOOD"], [0.181, "MISS"]]:
		check(GameBalance.judge(pair[0]) == pair[1], "timing boundary %s" % pair[0])
	GameData.reset_quiz()
	GameData.quiz_correct = 10
	var first := ScoreManager.apply_hit(1, 0.0)
	check(first.points == 154 and GameData.combo == 1, "first press uses quiz bonus")
	ScoreManager.apply_hit(5, 0.1)
	check(GameData.combo == 2 and GameData.max_combo == 2, "GOOD extends combo")
	ScoreManager.apply_hit(3, 0.25)
	check(GameData.combo == 0 and GameData.max_combo == 2, "MISS resets combo only")
	check(GameData.perfect_count == 1 and GameData.good_count == 1 and GameData.miss_count == 1, "judgment counts")
	GameData.combo = 49
	check(ScoreManager.apply_hit(7, 0.0).milestone, "50 combo milestone")
	check(GameBalance.rank_for(1000, 1000) == "SS" and GameBalance.rank_for(0, 1000) == "C", "rank boundaries")
	GameData.reset_quiz()

func _test_save() -> void:
	SaveManager.record_quiz("test", "normal", 8)
	check(SaveManager.record_score("test", "normal", 1000, 3), "first record")
	check(not SaveManager.record_score("test", "normal", 500, 1), "lower score does not overwrite")
	SaveManager.record_quiz("test", "normal", 3)
	SaveManager.record_score("test", "hard", 2000, 4)
	SaveManager.records = {}
	SaveManager.load_progress()
	var record := SaveManager.record_for("test", "normal")
	check(record.score == 1000 and record.quiz_best == 8 and record.quiz_last == 3, "save roundtrip")
	check(SaveManager.record_for("test", "hard").score == 2000, "difficulty isolation")
	check(SaveManager.last_error.is_empty(), "save succeeded")

func _test_board() -> void:
	var board := PuzzleManager.new()
	board.size = Vector2(346, 420)
	add_child(board)
	await get_tree().process_frame
	check(board.pieces.size() == 48, "board populated")
	for count in [3, 4, 5]:
		board.color_count = count
		for run in 15:
			board.generate()
			var move := board.find_move()
			check(move.size() == 3, "legal move guaranteed")
			_arm(board, move[0])
			board.begin_drag(move[0].position)
			_arm(board, move[1])
			board.move_drag(move[1].position)
			_arm(board, move[0])
			board.move_drag(move[0].position)
			check(board.chain.size() == 1, "backtracking removes last piece")
			_arm(board, move[1])
			board.move_drag(move[1].position)
			_arm(board, move[2])
			board.move_drag(move[2].position)
			check(board.chain.size() >= 3, "drag connects adjacent colors")
			board.end_drag()
			check(board.chain.size() >= 3, "release preserves selected chain")
			board.clear_chain()
			check(board.pieces.size() == 48, "refill preserves count")
			check(not board.find_move().is_empty(), "move after refill")
			for piece in board.pieces:
				check(Rect2(Vector2.ZERO, board.size).has_point(piece.target), "target inside board")
	board.generate()
	var move := board.find_move()
	_arm(board, move[0])
	board.begin_drag(move[0].position)
	board.end_drag()
	check(board.pieces.size() == 48 and not board.dragging, "short chains do not delete")
	_arm(board, move[0])
	board.begin_drag(move[0].position)
	board.cancel_drag()
	check(board.chain.is_empty() and board.active_touch == -1, "cancel clears pointer")
	# Force an otherwise unplayable board and verify deterministic repair.
	for piece in board.pieces:
		piece.color_index = (piece.column + piece.row * 2) % 5
	board.ensure_move()
	check(not board.find_move().is_empty(), "dead board repaired")
	await _test_pointer_events(board)
	_test_press_timing(board)
	board.queue_free()
	await get_tree().process_frame

func _test_pointer_events(board: PuzzleManager) -> void:
	board.generate()
	await get_tree().process_frame
	var move := board.find_move()
	var press := InputEventMouseButton.new()
	press.button_index = MOUSE_BUTTON_LEFT
	press.pressed = true
	press.position = board.get_global_transform_with_canvas() * move[0].position
	_arm(board, move[0])
	_inject_pointer(press)
	await get_tree().process_frame
	for i in [1, 2]:
		var motion := InputEventMouseMotion.new()
		motion.position = board.get_global_transform_with_canvas() * move[i].position
		motion.button_mask = MOUSE_BUTTON_MASK_LEFT
		_arm(board, move[i])
		_inject_pointer(motion)
		await get_tree().process_frame
	check(board.chain.size() >= 3, "mouse events connect chain")
	var release := InputEventMouseButton.new()
	release.button_index = MOUSE_BUTTON_LEFT
	release.position = Vector2(-50, -50)
	_inject_pointer(release)
	await get_tree().process_frame
	check(not board.dragging and board.chain.size() >= 3, "release outside board preserves chain")
	board.generate()
	move = board.find_move()
	var touch := InputEventScreenTouch.new()
	touch.index = 0
	touch.pressed = true
	touch.position = board.get_global_transform_with_canvas() * move[0].position
	_arm(board, move[0])
	_inject_pointer(touch)
	await get_tree().process_frame
	for i in [1, 2]:
		var drag := InputEventScreenDrag.new()
		drag.index = 0
		drag.position = board.get_global_transform_with_canvas() * move[i].position
		_arm(board, move[i])
		_inject_pointer(drag)
		await get_tree().process_frame
	check(board.chain.size() >= 3, "touch events connect chain")
	touch = InputEventScreenTouch.new()
	touch.index = 0
	touch.pressed = false
	touch.canceled = true
	touch.position = Vector2(-50, -50)
	_arm(board, move[0])
	_inject_pointer(touch)
	await get_tree().process_frame
	check(not board.dragging and board.chain.size() >= 3, "touch cancel releases pointer without clearing chain")
	for use_touch in [false, true]:
		board.generate()
		move = board.find_move()
		for piece in move:
			var tap: InputEvent
			if use_touch:
				tap = InputEventScreenTouch.new()
				tap.index = 0
			else:
				tap = InputEventMouseButton.new()
				tap.button_index = MOUSE_BUTTON_LEFT
			tap.pressed = true
			tap.position = board.get_global_transform_with_canvas() * piece.position
			var up: InputEvent = tap.duplicate()
			up.pressed = false
			_arm(board, piece)
			_inject_pointer(tap)
			await get_tree().process_frame
			_inject_pointer(up)
			await get_tree().process_frame
		check(board.chain.size() == 3 and not board.dragging, "separate press/release events retain 3-chain; touch=" + str(use_touch))

func _screen(name: String) -> Node:
	GameData.go(name)
	await get_tree().process_frame
	await get_tree().process_frame
	return get_tree().current_scene

func _test_layouts() -> void:
	for dimensions in [Vector2i(390, 844), Vector2i(360, 640), Vector2i(430, 932), Vector2i(1024, 768)]:
		get_window().size = dimensions
		var game := await _screen("Game")
		await get_tree().process_frame
		check(game.board.size.y >= 320, "board retains usable height")
		check(game.content.get_global_rect().end.x <= game.size.x + 1, "content stays inside width")
		check(game.content.get_global_rect().end.y <= game.size.y + 1, "game stays inside height")
		for piece in game.board.pieces:
			check(piece.target.x - game.board.radius >= 0 and piece.target.x + game.board.radius <= game.board.size.x, "piece radius inside field")
	get_window().size = Vector2i(390, 844)

func _snapshot(name: String) -> void:
	if capture:
		await get_tree().create_timer(0.3).timeout
		await RenderingServer.frame_post_draw
		get_viewport().get_texture().get_image().save_png("res://build/" + name + ".png")

func _test_flow() -> void:
	var screen := await _screen("Title")
	await _snapshot("title")
	check(screen.content.get_child_count() > 0, "title constructed")
	screen._settings()
	check(is_instance_valid(screen.modal_layer), "settings opens")
	_check_modal_fonts(screen.modal_layer)
	await _snapshot("settings")
	screen.close_modal()
	screen._help()
	_check_modal_fonts(screen.modal_layer)
	await _snapshot("help")
	screen.close_modal()
	screen._start()
	await get_tree().process_frame
	await get_tree().process_frame
	screen = get_tree().current_scene
	check(screen.name == "MusicSelect", "start routes to music")
	screen._switch(1)
	check(GameData.selected_music == 1, "music navigation")
	screen._select(2)
	check(GameData.selected_difficulty == 2, "difficulty selection")
	await _snapshot("music")
	screen = await _screen("QuizSelect")
	await _snapshot("genres")
	screen._choose("セキュリティ")
	await get_tree().process_frame
	await get_tree().process_frame
	screen = get_tree().current_scene
	check(screen.name == "Quiz" and screen.questions.size() == 10, "quiz starts")
	await _snapshot("quiz")
	screen.show_pause()
	check(get_tree().paused, "quiz pauses")
	screen.resume_game()
	for i in 10:
		var answer := int(screen.questions[i].answer)
		screen._answer(answer if i < 8 else (answer + 1) % 4)
		screen._answer(answer)
		if i == 0:
			check(GameData.quiz_correct == 1, "double answer ignored")
		screen._next()
	check(GameData.quiz_correct == 8 and GameData.quiz_wrong == 2, "ten question score")
	await get_tree().process_frame
	await get_tree().process_frame
	screen = get_tree().current_scene
	check(screen.name == "Countdown", "countdown follows quiz")
	check(not MusicManager.active, "music does not start during countdown")
	screen.show_pause()
	var count_text: String = screen.count_label.text
	await get_tree().create_timer(1.1).timeout
	check(screen.count_label.text == count_text, "countdown pauses")
	screen.resume_game()
	await get_tree().create_timer(3.6).timeout
	screen = get_tree().current_scene
	check(screen.name == "Game" and MusicManager.active, "game starts with music")
	await get_tree().create_timer(0.3).timeout
	await _snapshot("game")
	var before := MusicManager.song_position()
	screen.show_pause()
	await _snapshot("pause")
	await get_tree().create_timer(0.2).timeout
	check(MusicManager.player.stream_paused and is_equal_approx(before, MusicManager.song_position()), "audio time frozen while paused")
	screen.resume_game()
	var prior_judgments := GameData.perfect_count + GameData.good_count + GameData.miss_count
	var board: PuzzleManager = screen.board
	var move := board.find_move()
	_arm(board, move[0])
	board.begin_drag(move[0].position)
	_arm(board, move[1])
	board.move_drag(move[1].position)
	_arm(board, move[2])
	board.move_drag(move[2].position)
	check(GameData.score > 0, "press produces score before release")
	var score_before_release := GameData.score
	var selected_count := board.chain.size()
	check(GameData.perfect_count + GameData.good_count + GameData.miss_count - prior_judgments == selected_count, "each new piece has its own judgment")
	board.end_drag()
	check(GameData.score == score_before_release and board.chain.size() == selected_count, "release neither judges nor clears")
	board.clear_chain()
	check(GameData.score == score_before_release and board.chain.is_empty(), "clear button removes pieces without another timing judgment")
	# Seek the real player to the end: exercise AudioStreamPlayer.finished routing.
	MusicManager.player.seek(MusicManager.duration() - 0.12)
	await get_tree().create_timer(0.6).timeout
	screen = get_tree().current_scene
	check(screen.name == "Result", "audio completion routes to result")
	await _snapshot("result")
	check(SaveManager.record_for(GameData.music().id, GameData.difficulty().id).get("score", 0) == GameData.score, "result saved")

func _check_modal_fonts(node: Node) -> void:
	if node is Label or node is Button:
		check(node.get_theme_font("font") == UI.FONT, "modal uses bundled Japanese font: " + str(node.name))
		check(node.get_theme_font("font").has_char("設".unicode_at(0)), "modal font contains Japanese glyphs")
	for child in node.get_children():
		_check_modal_fonts(child)

func _test_ring() -> void:
	for bpm in [100.0, 120.0, 140.0]:
		check(is_equal_approx(GameBalance.ring_progress(1.0, bpm), 1.0), "ring reaches edge on beat")
		check(GameBalance.ring_progress(0.4, bpm) < GameBalance.ring_progress(0.7, bpm), "inner ring expands toward beat")
		check(GameBalance.ring_progress(0.5, bpm) < 1.0, "off-beat ring is inside piece")

func _arm(board: PuzzleManager, piece: PuzzlePiece, error := 0.0) -> void:
	board.active_note = piece
	board.note_due_beat = float(board.beat_source.call()) - error * board.scheduler.bpm / 60.0

func _test_scheduler() -> void:
	for cadence in [4.0, 2.0, 1.0]:
		var scheduler := RhythmScheduler.new()
		scheduler.configure(120, cadence)
		var notes: Array = []
		for tick in 9600:
			var due := scheduler.poll(tick / 100.0, true)
			if not is_inf(due): notes.append(due)
		check(notes.size() == int(96 / cadence), "difficulty changes note frequency")
		for i in range(1, notes.size()):
			check(is_equal_approx(notes[i] - notes[i-1], cadence), "notes align to song beats")
		scheduler.configure(120, cadence)
		check(is_inf(scheduler.poll(40.0, true)), "stale notes skipped after frame jump")
		check(is_inf(scheduler.poll(40.0, true)), "no catch-up burst")

func _test_press_timing(board: PuzzleManager) -> void:
	board.generate()
	board.beat_source = func(): return 0.0
	var events: Array = []
	var collect := func(length: int, error: float): events.append([length, GameBalance.judge(error)])
	board.piece_pressed.connect(collect)
	var move := board.find_move()
	board.begin_drag(move[0].position)
	check(events.is_empty() and board.chain.is_empty(), "unmarked pieces ignore presses")
	for i in 3:
		_arm(board, move[i], [0.0, 0.12, -0.25][i])
		board.begin_drag(move[i].position)
		board.end_drag()
	check(events.size() == 3 and events[0][1] == "PERFECT" and events[1][1] == "GOOD" and events[2][1] == "MISS", "each note judges on press")
	check(board.chain.size() == 3, "release preserves chain")
	board.clear_chain()
	check(board.pieces.size() == 48 and board.chain.is_empty(), "clear refills board")
	board.generate()
	board.begin_drag(move[0].position)
	check(events.size() == 3, "consumed note cannot be scored twice")
	var missed: Array = []
	board.note_missed.connect(func(): missed.append(true))
	board.start_rhythm(120, 2)
	board._update_rhythm(0.0)
	check(board.active_note == null, "no rings between scheduled notes")
	board._update_rhythm(2.0 - board.scheduler.lead_beats)
	check(board.active_note != null and board.note_candidates().has(board.active_note), "one random legal target appears")
	board._update_rhythm(2.4)
	board._update_rhythm(2.5)
	check(missed.size() == 1 and board.active_note == null, "missed note expires exactly once")
	var seen: Array = []
	board.rng.seed = 42
	for i in 12:
		board.cancel_drag()
		board.scheduler.next_beat = 4.0 + i * 2
		board._update_rhythm(board.scheduler.next_beat - board.scheduler.lead_beats)
		if not seen.has(board.active_note): seen.append(board.active_note)
	check(seen.size() > 1, "targets vary across scheduled notes")
	board.cancel_drag()
	board.rhythm_enabled = false
	board.piece_pressed.disconnect(collect)
	board.beat_source = func(): return MusicManager.beat_position()

func _inject_pointer(event: InputEvent) -> void:
	# parse_input_event takes window pixels, not stretched canvas coordinates.
	# Headless defaults to a 64x64 window, so a direct position only worked at 1x.
	event.position = get_viewport().get_final_transform() * event.position
	Input.parse_input_event(event)

func _test_editor_edits() -> void:
	var editable := load("res://scenes/Title.tscn").instantiate() as Control
	var title := editable.find_child("TitleText", true, false) as Label
	title.text = "エディタから変更"
	title.add_theme_font_size_override("font_size", 42)
	editable.find_child("StartButton", true, false).text = "遊び始める"
	editable.find_child("SafeArea", true, false).add_theme_constant_override("margin_left", 31)
	editable.find_child("VolumeLabel", true, false).text = "音の大きさ {volume}%"
	var added := Label.new()
	added.name = "AuthorAddedLabel"
	added.text = "追加した説明"
	editable.find_child("Content", true, false).add_child(added)
	added.owner = editable
	var packed := PackedScene.new()
	check(packed.pack(editable) == OK, "editor changes serialize")
	editable.free()
	var screen := packed.instantiate() as ScreenBase
	add_child(screen)
	await get_tree().process_frame
	check(screen.ui("TitleText").text == "エディタから変更", "saved Label.Text survives runtime ready")
	check(screen.ui("TitleText").get_theme_font_size("font_size") == 42, "saved font style survives runtime ready")
	check(screen.ui("StartButton").text == "遊び始める", "saved button text survives runtime ready")
	check(screen.safe_margin.get_theme_constant("margin_left") == 31, "editor spacing survives safe area setup")
	check(screen.ui("AuthorAddedLabel") != null, "author-added UI is retained")
	check(not screen.has_node("EditorPreview"), "there is no disposable preview tree")
	var help: Node = screen.ui("HelpDialog")
	screen._help()
	screen.close_modal()
	screen._help()
	check(screen.modal_layer == help, "dialog is the saved scene node, not regenerated")
	screen._settings()
	check(screen.ui("VolumeLabel").text.begins_with("音の大きさ "), "editor dynamic text template retained")
	screen.close_modal()
	screen.free()
	GameData.selected_music = 0
	GameData.selected_difficulty = 0
	var music := load("res://scenes/MusicSelect.tscn").instantiate() as ScreenBase
	music.ui("RecordScore").text = "最高記録 {score}"
	var song_node: Node = music.ui("SongTitle")
	add_child(music)
	music._switch(1)
	check(music.ui("SongTitle") == song_node and song_node.text == GameData.music().title, "song changes update existing node")
	check(music.ui("RecordScore").text == "最高記録 000000", "custom format survives song change")
	music.free()
	var quiz := load("res://scenes/Quiz.tscn").instantiate() as ScreenBase
	quiz.ui("QuestionCount").text = "問題 {number}"
	var question_node: Node = quiz.ui("QuestionText")
	add_child(quiz)
	quiz._answer(int(quiz.questions[0].answer))
	quiz._next()
	check(quiz.ui("QuestionText") == question_node, "next question keeps authored UI")
	check(quiz.ui("QuestionCount").text == "問題 2", "custom format survives question change")
	quiz.free()
	GameData.selected_music = 0
	GameData.selected_difficulty = 0
	GameData.reset_quiz()

func _test_audio_chart() -> void:
	var envelope: Array[float] = []
	envelope.resize(500)
	envelope.fill(0.0)
	for index in [103, 181, 297, 411]: envelope[index] = 0.5
	var attacks := AudioChart.detect(envelope, 0.01)
	check(attacks.size() == 4, "irregular attacks detected; silence has no notes")
	var times := AudioChart.notes(attacks, 2)
	check(times.size() == 4 and is_equal_approx(times[1], 1.81), "chart retains off-grid audio timestamps")
	var scheduler := RhythmScheduler.new()
	scheduler.configure_chart(times)
	check(is_equal_approx(scheduler.poll(0.72, true), 1.03), "chart previews first attack")
	check(is_inf(scheduler.poll(1.2, true)), "no invented periodic note")
	check(is_inf(scheduler.poll(6.0, true)), "chart ends without catchup burst")
	for song in GameData.music_catalog:
		var notes := MusicManager.chart_for(song, 2)
		check(notes.size() > 10, "actual audio decodes to a playable chart")
		for i in range(1, notes.size()):
			check(float(notes[i]) - float(notes[i - 1]) >= 0.55, "single ring has time for late judgment and next preview")

	var original_root := GameData.library_root
	var original_catalog := GameData.music_catalog.duplicate(true)
	GameData.library_root = "/tmp/music-import-test-%d/" % OS.get_process_id()
	DirAccess.make_dir_recursive_absolute(GameData.library_root)
	var source := ProjectSettings.globalize_path("res://assets/music/mint_circuit.wav")
	check(GameData.import_song(source).is_empty(), "external WAV imports and persists")
	var imported := GameData.music().duplicate(true)
	check(imported.get("imported", false) and FileAccess.file_exists(imported.audio), "import retains its own audio copy")
	check(MusicManager.play_song(imported), "imported audio can play")
	MusicManager.stop()
	check(GameData.import_song(source).is_empty() and GameData.music_catalog.size() == 4, "duplicate import selects existing song")
	GameData.music_catalog = original_catalog.duplicate(true)
	GameData.load_imports()
	check(GameData.music_catalog.size() == 4, "saved library reloads")
	GameData.music_catalog = original_catalog
	GameData.selected_music = 0
	GameData.library_root = original_root

func _test_special_notes() -> void:
	var times: Array = []
	for i in 40: times.append(1.1 + i * 0.6)
	for difficulty in 3:
		var chart := AudioChart.playable(times, difficulty, 0.9)
		var kinds: Array = chart.map(func(event: Dictionary): return event.kind)
		check(kinds.has("hold") == (difficulty >= 1), "hold difficulty gate")
		check(kinds.has("double") == (difficulty == 2), "double difficulty gate")
		for i in range(1, chart.size()):
			check(float(chart[i].time) - float(chart[i - 1].end) >= 1.1, "full approach window after previous note")
	var slow := RhythmScheduler.new()
	slow.configure_chart(times, 2.0, 2)
	check(is_equal_approx(slow.lead_beats, 2.0), "configured approach duration retained")
	var original: float = SaveManager.settings.approach_seconds
	SaveManager.settings.approach_seconds = 1.7
	SaveManager.persist()
	SaveManager.settings.approach_seconds = 0.9
	SaveManager.load_progress()
	check(is_equal_approx(SaveManager.settings.approach_seconds, 1.7), "approach setting persists")
	SaveManager.settings.approach_seconds = original
	var board := PuzzleManager.new()
	board.size = Vector2(360, 400)
	add_child(board)
	await get_tree().process_frame
	board.scheduler.configure_chart([], 0.9, 2)
	var clock := [2.0]
	board.beat_source = func(): return clock[0]
	var hits: Array = []
	var misses: Array = []
	board.piece_pressed.connect(func(length: int, error: float): hits.append([length, error]))
	board.note_missed.connect(func(): misses.append(true))
	var move := board.find_move()
	board.active_note = move[0]
	board.note_kind = "hold"
	board.note_due_beat = 2.0
	board.hold_end = 2.7
	board._special_press(0, move[0].position)
	check(board.holding and hits.is_empty(), "hold onset does not score before completion")
	clock[0] = 2.4
	board._special_release(0)
	check(misses.size() == 1 and hits.is_empty(), "early hold release misses once")
	board._special_release(0)
	check(misses.size() == 1, "repeat release does not double miss")
	clock[0] = 3.0
	board.active_note = move[0]
	board.note_kind = "hold"
	board.note_due_beat = 3.0
	board.hold_end = 3.7
	board._special_press(0, move[0].position)
	clock[0] = 3.7
	board._update_rhythm(3.7)
	check(hits.size() == 1 and board.chain.size() == 1, "completed hold scores and connects once")
	board.cancel_drag()
	clock[0] = 4.0
	board.active_note = move[0]
	board.secondary_note = move[1]
	board.note_due_beat = 4.0
	board.note_kind = "double"
	board._special_press(0, move[1].position)
	check(hits.size() == 1, "one side of double does not score")
	board._special_press(0, move[0].position)
	check(hits.size() == 1, "same pointer cannot satisfy both sides")
	clock[0] = 4.04
	board._special_press(1, move[0].position)
	check(hits.size() == 3 and board.chain.size() == 2, "two concurrent pointers score in either order")
	board.cancel_drag()
	clock[0] = 5.0
	board.active_note = move[0]
	board.secondary_note = move[1]
	board.note_due_beat = 5.0
	board.note_kind = "double"
	board._special_press(-1, move[0].position)
	clock[0] = 5.12
	board._special_press(-2, move[1].position)
	check(misses.size() == 2 and hits.size() == 3, "sequential presses outside simultaneous tolerance fail")
	board.active_note = move[0]
	board.note_kind = "hold"
	board.note_due_beat = 5.12
	board.hold_end = 6.0
	board._special_press(0, move[0].position)
	board.suspend_input()
	check(not board.holding and board.pointer_notes.is_empty() and hits.size() == 3, "pause clears held pointers without phantom completion")
	board.queue_free()
	await get_tree().process_frame
