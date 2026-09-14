extends Node

var library_root := "user://"

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
	load_imports()

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

func load_imports() -> void:
	var config := ConfigFile.new()
	if config.load(library_root + "songs.cfg") != OK: return
	var songs: Variant = config.get_value("library", "songs", [])
	if songs is Array:
		for song in songs:
			if song is Dictionary and FileAccess.file_exists(str(song.get("audio", ""))):
				music_catalog.append(song)

func import_song(path: String) -> String:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null: return "ファイルを開けませんでした。"
	if file.get_length() > 100 * 1024 * 1024: return "100MB以下の音源を選んでください。"
	var stream := MusicManager.load_audio(path)
	if stream == null or stream.get_length() < 2 or stream.get_length() > 900:
		return "2秒〜15分のWAV・MP3・OGG音源を選んでください。"
	var id := "local_" + FileAccess.get_sha256(path)
	for i in music_catalog.size():
		if music_catalog[i].id == id:
			selected_music = i
			return ""
	var attacks := AudioChart.analyze(stream)
	if attacks.is_empty(): return "音の立ち上がりを検出できませんでした。別の曲を選んでください。"
	DirAccess.make_dir_recursive_absolute(library_root + "songs")
	var destination := library_root + "songs/" + id + "." + path.get_extension().to_lower()
	if DirAccess.copy_absolute(path, destination) != OK: return "音源を保存できませんでした。"
	var song: Dictionary = music_catalog[0].duplicate(true)
	song.merge({"id": id, "title": path.get_file().get_basename(), "artist": "マイミュージック · 自動譜面", "audio": destination, "duration": stream.get_length(), "bpm": 60, "attacks": attacks, "imported": true}, true)
	var imports: Array = music_catalog.filter(func(item: Dictionary): return item.get("imported", false))
	imports.append(song)
	var config := ConfigFile.new()
	config.set_value("library", "songs", imports)
	if config.save(library_root + "songs.cfg.tmp") != OK: return "曲リストを保存できませんでした。"
	if DirAccess.rename_absolute(library_root + "songs.cfg.tmp", library_root + "songs.cfg") != OK: return "曲リストを保存できませんでした。"
	music_catalog.append(song)
	selected_music = music_catalog.size() - 1
	selected_difficulty = 0
	return ""
