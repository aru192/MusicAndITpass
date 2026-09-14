@tool
class_name RhythmScheduler
extends RefCounted

var chart: Array = []
var chart_index := 0
var chart_mode := false
var events: Array = []
var current_event: Dictionary = {}

func configure_chart(times: Array, approach := 0.32, difficulty := -1) -> void:
	events = AudioChart.playable(times, difficulty, approach) if difficulty >= 0 else []
	current_event = {}
	chart = times.duplicate()
	if difficulty >= 0: chart = events.map(func(event: Dictionary): return event.time)
	chart.sort()
	chart_index = 0
	chart_mode = true
	bpm = 60.0
	lead_beats = approach

var bpm := 120.0
var interval_beats := 2.0
var lead_beats := 1.0
var next_beat := 2.0

func configure(song_bpm: float, cadence_beats: float) -> void:
	chart_mode = false
	bpm = maxf(song_bpm, 1.0)
	interval_beats = maxf(cadence_beats, 1.0)
	var seconds_per_beat := 60.0 / bpm
	# Leave room for the previous note's late window; only one ring is active.
	var lead_seconds := minf(0.65, interval_beats * seconds_per_beat - GameBalance.GOOD_WINDOW - 0.04)
	lead_beats = maxf(0.08, lead_seconds) / seconds_per_beat
	next_beat = interval_beats

func poll(beat: float, available: bool) -> float:
	if chart_mode:
		while chart_index < chart.size():
			var target := float(chart[chart_index])
			if beat < target - lead_beats: return -INF
			chart_index += 1
			if beat > target + GameBalance.GOOD_WINDOW or not available: continue
			current_event = events[chart_index - 1] if not events.is_empty() else {"kind": "tap", "time": target, "end": target}
			return target
		return -INF
	if beat < next_beat - lead_beats:
		return -INF
	if not available or beat > next_beat + GameBalance.GOOD_WINDOW * bpm / 60.0:
		# Do not emit a burst of old notes after falling pieces or a delayed frame.
		next_beat = (floorf((beat + lead_beats) / interval_beats) + 1.0) * interval_beats
		return -INF
	var due := next_beat
	next_beat += interval_beats
	return due
