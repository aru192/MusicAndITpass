@tool
class_name RhythmScheduler
extends RefCounted

var bpm := 120.0
var interval_beats := 2.0
var lead_beats := 1.0
var next_beat := 2.0

func configure(song_bpm: float, cadence_beats: float) -> void:
	bpm = maxf(song_bpm, 1.0)
	interval_beats = maxf(cadence_beats, 1.0)
	var seconds_per_beat := 60.0 / bpm
	# Leave room for the previous note's late window; only one ring is active.
	var lead_seconds := minf(0.65, interval_beats * seconds_per_beat - GameBalance.GOOD_WINDOW - 0.04)
	lead_beats = maxf(0.08, lead_seconds) / seconds_per_beat
	next_beat = interval_beats

func poll(beat: float, available: bool) -> float:
	if beat < next_beat - lead_beats:
		return -INF
	if not available or beat > next_beat + GameBalance.GOOD_WINDOW * bpm / 60.0:
		# Do not emit a burst of old notes after falling pieces or a delayed frame.
		next_beat = (floorf((beat + lead_beats) / interval_beats) + 1.0) * interval_beats
		return -INF
	var due := next_beat
	next_beat += interval_beats
	return due
