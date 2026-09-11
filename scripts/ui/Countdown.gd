extends ScreenBase

@export_group("Display text")
@export var countdown_steps := PackedStringArray(["3", "2", "1"])
@export var start_text := "START"
@export var start_font_size := 65
var count_label: Label

func bind_screen() -> void:
	pause_enabled = true
	count_label = ui("CountLabel")
	render("QuizSummary", {"correct": GameData.quiz_correct})
	render("BonusSummary", {"bonus": "%.2f" % GameBalance.quiz_bonus(GameData.quiz_correct)})
	render("SongSummary", {"title":GameData.music().title, "bpm":GameData.music().bpm})
	_run_countdown()

func _run_countdown() -> void:
	for count in countdown_steps:
		count_label.text = count
		await get_tree().create_timer(1.0, false).timeout
	count_label.text = start_text
	count_label.add_theme_font_size_override("font_size", start_font_size)
	await get_tree().create_timer(0.35, false).timeout
	GameData.reset_game()
	GameData.go("Game")
