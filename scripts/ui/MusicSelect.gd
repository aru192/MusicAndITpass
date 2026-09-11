extends ScreenBase

@export_group("Display text")
@export var preview_stop_text := "■ 試聴を止める"
@export var audio_error_text := "音源を読み込めませんでした"
@export var cleared_text := "CLEAR"
@export var unplayed_text := "未プレイ"

var details: VBoxContainer
var difficulties: VBoxContainer
var score_label: Label
var quiz_label: Label
var preview_button: Button
var previewing := false
var _preview_text := ""

func bind_screen() -> void:
	details = ui("SongDetails")
	difficulties = ui("Difficulties")
	score_label = ui("RecordScore")
	quiz_label = ui("RecordQuiz")
	preview_button = ui("PreviewButton")
	_preview_text = preview_button.text
	connect_button("BackButton", func(): GameData.go("Title"))
	connect_button("PlayButton", func(): GameData.go("QuizSelect"))
	connect_button("PreviousSongButton", _switch.bind(-1))
	connect_button("NextSongButton", _switch.bind(1))
	connect_button("PreviewButton", _preview)
	for i in difficulties.get_child_count():
		(difficulties.get_child(i) as Button).pressed.connect(_select.bind(i))
	MusicManager.song_finished.connect(_preview_finished)
	_draw_song()

func _draw_song() -> void:
	var song := GameData.music()
	render("TrackNumber", {"current": "%02d" % (GameData.selected_music + 1), "total": "%02d" % GameData.music_catalog.size()})
	ui("SongJacket").texture = load(song.jacket)
	render("SongTitle", {"title": song.title})
	render("SongArtist", {"artist": song.artist})
	render("SongInfo", {"bpm": song.bpm, "duration": roundi(song.duration)})
	preview_button.text = _preview_text
	_draw_difficulties()
	_update_record()

func _draw_difficulties() -> void:
	var options: Array = GameData.music().difficulties
	for i in difficulties.get_child_count():
		var button := difficulties.get_child(i) as Button
		button.visible = i < options.size()
		if not button.visible: continue
		var option: Dictionary = options[i]
		render(str(button.name), {"name":option.name, "level":"%02d" % option.level, "interval":option.note_interval_beats})
		button.set_pressed_no_signal(i == GameData.selected_difficulty)

func _select(index: int) -> void:
	GameData.selected_difficulty = index
	_draw_difficulties()
	_update_record()

func _update_record() -> void:
	var record := SaveManager.record_for(GameData.music().id, GameData.difficulty().id)
	render("RecordScore", {"score": "%06d" % int(record.get("score", 0))})
	render("RecordQuiz", {"best": int(record.get("quiz_best", 0)), "status": cleared_text if record.get("cleared", false) else unplayed_text})

func _switch(direction: int) -> void:
	MusicManager.stop()
	previewing = false
	GameData.selected_music = posmod(GameData.selected_music + direction, GameData.music_catalog.size())
	GameData.selected_difficulty = mini(GameData.selected_difficulty, GameData.music().difficulties.size() - 1)
	_draw_song()

func _preview() -> void:
	if previewing:
		MusicManager.stop()
		_preview_finished()
	else:
		previewing = MusicManager.play_song(GameData.music())
		preview_button.text = preview_stop_text if previewing else audio_error_text

func _preview_finished() -> void:
	previewing = false
	preview_button.text = _preview_text

func _notification(what: int) -> void:
	super._notification(what)
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT and previewing:
		MusicManager.stop()
		_preview_finished()
