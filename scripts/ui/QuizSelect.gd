extends ScreenBase

func bind_screen() -> void:
	connect_button("BackButton", func(): GameData.go("MusicSelect"))
	for button in find_children("Genre*", "Button", true, false):
		button.pressed.connect(_choose.bind(str(button.get_meta("genre", "all"))))

func _choose(genre: String) -> void:
	GameData.selected_quiz = genre
	GameData.reset_quiz()
	GameData.go("Quiz")
