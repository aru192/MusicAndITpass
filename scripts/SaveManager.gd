extends Node

signal save_failed
var save_path := "user://progress.cfg"
var records: Dictionary = {}
var settings: Dictionary = {"volume": 0.7, "offset_ms": 0.0, "reduced_motion": false}
var last_error := ""

func _ready() -> void:
	load_progress()

func load_progress() -> void:
	var config := ConfigFile.new()
	var error := config.load(save_path)
	if error != OK:
		error = config.load(save_path + ".bak")
	if error != OK:
		return
	var stored: Variant = config.get_value("progress", "records", {})
	if stored is Dictionary:
		records = stored
	settings.volume = clampf(float(config.get_value("settings", "volume", 0.7)), 0.0, 1.0)
	settings.offset_ms = clampf(float(config.get_value("settings", "offset_ms", 0.0)), -300.0, 300.0)
	settings.reduced_motion = bool(config.get_value("settings", "reduced_motion", false))

func record_for(music_id: String, difficulty_id: String) -> Dictionary:
	var value: Variant = records.get(music_id + "/" + difficulty_id, {})
	return value if value is Dictionary else {}

func record_quiz(music_id: String, difficulty_id: String, correct: int) -> void:
	var record := record_for(music_id, difficulty_id).duplicate()
	record["quiz_best"] = maxi(int(record.get("quiz_best", 0)), correct)
	record["quiz_last"] = correct
	records[music_id + "/" + difficulty_id] = record
	persist()

func record_score(music_id: String, difficulty_id: String, score: int, combo: int) -> bool:
	var record := record_for(music_id, difficulty_id).duplicate()
	var is_new := score > int(record.get("score", 0))
	record["score"] = maxi(score, int(record.get("score", 0)))
	record["max_combo"] = maxi(combo, int(record.get("max_combo", 0)))
	record["cleared"] = true
	records[music_id + "/" + difficulty_id] = record
	persist()
	return is_new

func persist() -> void:
	var config := ConfigFile.new()
	config.set_value("progress", "version", 1)
	config.set_value("progress", "records", records)
	for key in settings:
		config.set_value("settings", key, settings[key])
	var error := config.save(save_path + ".tmp")
	if error == OK:
		if FileAccess.file_exists(save_path):
			DirAccess.copy_absolute(save_path, save_path + ".bak")
		error = DirAccess.rename_absolute(save_path + ".tmp", save_path)
	last_error = "" if error == OK else "保存できませんでした。ストレージを確認してください。"
	if error != OK:
		save_failed.emit()
