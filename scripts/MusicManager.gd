extends Node

signal song_finished
var player: AudioStreamPlayer
var track: Dictionary = {}
var output_latency := 0.0
var last_position := 0.0
var active := false

func _ready() -> void:
	player = AudioStreamPlayer.new()
	player.name = "BGM"
	player.playback_type = AudioServer.PLAYBACK_TYPE_STREAM
	add_child(player)
	player.finished.connect(_on_finished)
	apply_volume()

func unlock() -> void:
	# A real user gesture starts the audio system before the delayed countdown.
	player.stream = preload("res://assets/sounds/unlock.wav")
	player.play()

func apply_volume() -> void:
	player.volume_db = linear_to_db(maxf(float(SaveManager.settings.volume), 0.0001))

func play_song(song: Dictionary) -> bool:
	stop()
	track = song
	var audio := load_audio(str(song.audio))
	if audio == null:
		return false
	player.stream = audio
	output_latency = AudioServer.get_output_latency()
	last_position = 0.0
	active = true
	apply_volume()
	player.play()
	return true

func stop() -> void:
	active = false
	if player:
		player.stop()
		player.stream_paused = false
	last_position = 0.0

func set_paused(value: bool) -> void:
	player.stream_paused = value

func song_position() -> float:
	if not active or player.stream_paused:
		return last_position
	var position := player.get_playback_position() + AudioServer.get_time_since_last_mix() - output_latency
	last_position = maxf(last_position, maxf(position, 0.0))
	return last_position

func beat_position() -> float:
	var calibrated := song_position() - float(track.get("beat_offset", 0.0)) - float(SaveManager.settings.offset_ms) / 1000.0
	return calibrated / (60.0 / float(track.get("bpm", 120.0)))

func timing_error() -> float:
	var beat := beat_position()
	return (beat - roundf(beat)) * (60.0 / float(track.get("bpm", 120.0)))

func duration() -> float:
	return player.stream.get_length() if player.stream else 0.0

func _on_finished() -> void:
	if active:
		active = false
		song_finished.emit()

func load_audio(path: String) -> AudioStream:
	if path.begins_with("res://"): return load(path) as AudioStream
	match path.get_extension().to_lower():
		"wav": return AudioStreamWAV.load_from_file(path)
		"mp3": return AudioStreamMP3.load_from_file(path)
		"ogg": return AudioStreamOggVorbis.load_from_file(path)
	return null

func chart_for(song: Dictionary, difficulty: int) -> Array:
	if not song.has("attacks"):
		var stream := load_audio(str(song.audio))
		song["attacks"] = AudioChart.analyze(stream) if stream else []
	return AudioChart.notes(song.attacks, difficulty)

func chart_position() -> float:
	return song_position() - float(SaveManager.settings.offset_ms) / 1000.0
