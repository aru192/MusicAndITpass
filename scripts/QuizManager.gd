class_name QuizManager
extends RefCounted

static func questions() -> Array:
	var data: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://resources/quiz/questions.json"))
	return data if data is Array else []

static func genres() -> Array[String]:
	var result: Array[String] = []
	for question in questions():
		if not result.has(str(question.genre)):
			result.append(str(question.genre))
	return result

static func make_round(genre: String) -> Array:
	var pool: Array = []
	for question in questions():
		if genre == "all" or question.genre == genre:
			pool.append(question.duplicate(true))
	pool.shuffle()
	if pool.size() < GameBalance.QUIZ_COUNT:
		return []
	pool = pool.slice(0, GameBalance.QUIZ_COUNT)
	for question in pool:
		var correct_text: String = question.choices[int(question.answer)]
		question.choices.shuffle()
		question.answer = question.choices.find(correct_text)
	return pool
