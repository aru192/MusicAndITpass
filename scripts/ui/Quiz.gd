extends ScreenBase

@export_group("Display text")
@export var final_next_text := "リズムゲームへ  →"
@export_multiline var correct_text := "○ 正解！\n{explanation}"
@export_multiline var incorrect_text := "× 不正解  正解は {answer}\n{explanation}"
@export_multiline var missing_questions_text := "問題が10問に足りません。問題データを確認してください。"
@export_group("Answer styles")
@export var correct_style: StyleBox
@export var incorrect_style: StyleBox

var questions: Array
var index := 0
var answered := false
var body: VBoxContainer
var progress_label: Label
var counts: Label
var answer_buttons: Array[Button] = []
var feedback: Label
var next_button: Button
var progress: ProgressBar
var _next_text := ""
var _disabled_styles: Array[StyleBox] = []

func bind_screen() -> void:
	pause_enabled = true
	questions = QuizManager.make_round(GameData.selected_quiz)
	body = ui("QuestionBody")
	progress_label = ui("QuestionCount")
	counts = ui("AnswerCounts")
	feedback = ui("Feedback")
	next_button = ui("NextButton")
	progress = ui("QuizProgress")
	_next_text = next_button.text
	for i in 4:
		var button := ui("Answer" + str(i)) as Button
		answer_buttons.append(button)
		_disabled_styles.append(button.get_theme_stylebox("disabled"))
		button.pressed.connect(_answer.bind(i))
		var minimum_height := button.custom_minimum_size.y
		var text := ui("AnswerText" + str(i)) as Label
		text.resized.connect(func(): button.custom_minimum_size.y = maxf(minimum_height, text.get_minimum_size().y + 24))
	next_button.pressed.connect(_next)
	if questions.is_empty():
		for button in answer_buttons: button.disabled = true
		show_error(missing_questions_text)
		return
	_draw_question()

func _draw_question() -> void:
	answered = false
	var question: Dictionary = questions[index]
	render("QuestionInfo", {"number":"%02d" % (index + 1), "genre":question.genre})
	render("QuestionText", {"question":question.question})
	for i in 4:
		answer_buttons[i].disabled = false
		answer_buttons[i].add_theme_stylebox_override("disabled", _disabled_styles[i])
		render("AnswerText" + str(i), {"letter":"ABCD"[i], "answer":question.choices[i]})
	feedback.visible = false
	next_button.text = _next_text if index < GameBalance.QUIZ_COUNT - 1 else final_next_text
	next_button.visible = false
	_update_counts()
	(body.get_parent() as ScrollContainer).scroll_vertical = 0

func _answer(choice: int) -> void:
	if answered or questions.is_empty():
		return
	answered = true
	var question: Dictionary = questions[index]
	var correct := choice == int(question.answer)
	if correct:
		GameData.quiz_correct += 1
	else:
		GameData.quiz_wrong += 1
	for i in answer_buttons.size():
		answer_buttons[i].disabled = true
		if i == int(question.answer) and correct_style:
			answer_buttons[i].add_theme_stylebox_override("disabled", correct_style)
		elif i == choice and incorrect_style:
			answer_buttons[i].add_theme_stylebox_override("disabled", incorrect_style)
	feedback.text = (correct_text if correct else incorrect_text).format({"answer":"ABCD"[int(question.answer)], "explanation":question.explanation})
	feedback.visible = true
	next_button.visible = true
	progress.value = index + 1
	_update_counts()
	if index == GameBalance.QUIZ_COUNT - 1:
		SaveManager.record_quiz(GameData.music().id, GameData.difficulty().id, GameData.quiz_correct)
	UI.animate(feedback)

func _next() -> void:
	if not answered:
		return
	index += 1
	if index == GameBalance.QUIZ_COUNT:
		MusicManager.unlock()
		GameData.go("Countdown")
	else:
		_draw_question()

func _update_counts() -> void:
	render("QuestionCount", {"number":index + 1})
	render("AnswerCounts", {"correct":GameData.quiz_correct,"wrong":GameData.quiz_wrong})
