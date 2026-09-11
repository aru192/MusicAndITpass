extends ScreenBase

@export_group("Display text")
@export var hit_text := "{judgment}  +{points}"
@export var milestone_text := "{combo} COMBO!  +{points}"
@export var chain_text := "{count} CHAIN  ·  次の同色の丸を押そう"
@export var clear_text := "{count}個を消す"
@export var miss_text := "MISS"
@export var refill_text := "つながるピースを補充しました"
@export var audio_error_text := "音源を読み込めません。楽曲データのAudioファイルを確認してください。"
@export_group("Judgment colors")
@export var success_color := Color("7760da")
@export var miss_color := Color("c74d70")

var board: PuzzleManager
var score_label: Label
var combo_label: Label
var judgment: Label
var chain_label: Label
var stats: Label
var time_label: Label
var progress: ProgressBar
var clear_button: Button
var ended := false
var _empty_chain_text := ""
var _clear_disabled_text := ""

func bind_screen() -> void:
	pause_enabled = true
	board = ui("PuzzleField")
	score_label = ui("ScoreLabel")
	combo_label = ui("ComboLabel")
	judgment = ui("Judgment")
	chain_label = ui("ChainLabel")
	stats = ui("Stats")
	time_label = ui("TimeLabel")
	progress = ui("SongProgress")
	clear_button = ui("ClearButton")
	_empty_chain_text = chain_label.text
	_clear_disabled_text = clear_button.text
	render("SongTitle", {"title":GameData.music().title})
	render("SongInfo", {"difficulty":GameData.difficulty().name,"bpm":GameData.music().bpm})
	render("BoostLabel", {"bonus":"%.2f" % GameBalance.quiz_bonus(GameData.quiz_correct),"interval":GameData.difficulty().note_interval_beats})
	ui("SongJacket").texture = load(GameData.music().jacket)
	board.color_count = int(GameData.difficulty().colors)
	board.generate()
	board.piece_pressed.connect(_on_piece_pressed)
	board.note_missed.connect(_on_note_missed)
	board.chain_changed.connect(_on_chain_changed)
	board.board_reshuffled.connect(func(): chain_label.text = refill_text)
	connect_button("ResetChainButton", board.cancel_drag)
	connect_button("ClearButton", board.clear_chain)
	_update_stats()
	MusicManager.song_finished.connect(_finish)
	if not MusicManager.play_song(GameData.music()):
		board.enabled = false
		show_error(audio_error_text)
	else:
		board.start_rhythm(float(GameData.music().bpm), float(GameData.difficulty().note_interval_beats))

func _process(_delta: float) -> void:
	if ended or not MusicManager.active:
		return
	var elapsed := MusicManager.song_position()
	var duration := MusicManager.duration()
	progress.value = elapsed / maxf(duration, 0.1) * 100
	var remaining := maxi(0, ceili(duration - elapsed))
	time_label.text = "%d:%02d" % [remaining / 60, remaining % 60]

func _update_stats() -> void:
	render("ScoreLabel", {"score":"%06d" % GameData.score})
	render("ComboLabel", {"combo":GameData.combo})
	render("Stats", {"perfect":GameData.perfect_count,"good":GameData.good_count,"miss":GameData.miss_count})

func _on_piece_pressed(chain_length: int, error_seconds: float) -> void:
	if ended:
		return
	var result := ScoreManager.apply_hit(chain_length, error_seconds)
	_update_stats()
	judgment.text = (milestone_text if result.milestone else hit_text).format({"judgment": result.judgment, "points":result.points,"combo":GameData.combo})
	judgment.add_theme_color_override("font_color", miss_color if result.judgment == "MISS" else success_color)
	UI.animate(judgment)

func _on_chain_changed(count: int) -> void:
	GameData.longest_chain = maxi(GameData.longest_chain, count)
	chain_label.text = chain_text.format({"count":count}) if count > 0 else _empty_chain_text
	clear_button.disabled = count < GameBalance.MIN_CHAIN
	clear_button.text = clear_text.format({"count":count}) if count >= GameBalance.MIN_CHAIN else _clear_disabled_text

func _on_note_missed() -> void:
	if ended:
		return
	ScoreManager.apply_miss()
	_update_stats()
	judgment.text = miss_text
	judgment.add_theme_color_override("font_color", miss_color)

func on_pause() -> void:
	if board:
		board.end_drag()

func _finish() -> void:
	if ended:
		return
	ended = true
	board.enabled = false
	board.cancel_drag()
	GameData.finish_game()
	GameData.go.call_deferred("Result")
