extends ScreenBase

@export_group("Display text")
@export var new_record_text := "NEW RECORD"

func bind_screen() -> void:
	render("SongTitle", {"title":GameData.music().title})
	render("DifficultyLabel", {"difficulty":GameData.difficulty().name,"level":"%02d" % GameData.difficulty().level})
	render("RankLabel", {"rank":GameBalance.rank_for(GameData.score, int(GameData.difficulty().rank_target))})
	if GameData.new_record: ui("RecordLabel").text = new_record_text
	render("TotalScore", {"score":"%06d" % GameData.score})
	var values := {"combo":GameData.max_combo,"chain":GameData.longest_chain,"perfect":GameData.perfect_count,"good":GameData.good_count,"miss":GameData.miss_count,"correct":GameData.quiz_correct}
	for field in ["MaxComboValue","LongestChainValue","PerfectValue","GoodValue","MissValue","QuizScoreValue"]:
		render(field, values)
	connect_button("ReplayButton", func():
		GameData.reset_quiz()
		GameData.go("Quiz"))
	connect_button("MusicButton", func(): GameData.go("MusicSelect"))
	connect_button("TitleButton", func(): GameData.go("Title"))
	if not SaveManager.last_error.is_empty(): show_error(SaveManager.last_error)
