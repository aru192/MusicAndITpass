extends Node

var music_catalog: Array = []
var selected_music := 0
var selected_difficulty := 0
var selected_quiz := "all"
var quiz_correct := 0
var quiz_wrong := 0
var score := 0
var combo := 0
var max_combo := 0
var perfect_count := 0
var good_count := 0
var miss_count := 0
var new_record := false
var longest_chain := 0

func _ready() -> void:
	var data: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://resources/music/catalog.json"))
	if data is Array:
		music_catalog = data

func music() -> Dictionary:
	return music_catalog[selected_music]

func difficulty() -> Dictionary:
	return music().difficulties[selected_difficulty]

func reset_quiz() -> void:
	quiz_correct = 0
	quiz_wrong = 0
	reset_game()

func reset_game() -> void:
	score = 0
	combo = 0
	max_combo = 0
	perfect_count = 0
	good_count = 0
	miss_count = 0
	longest_chain = 0
	new_record = false

func finish_game() -> void:
	new_record = SaveManager.record_score(music().id, difficulty().id, score, max_combo)

func go(screen: String) -> void:
	get_tree().paused = false
	MusicManager.stop()
	get_tree().change_scene_to_file("res://scenes/" + screen + ".tscn")
