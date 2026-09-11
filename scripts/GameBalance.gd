@tool
class_name GameBalance
extends RefCounted

const QUIZ_COUNT := 10
const MIN_CHAIN := 3
const PERFECT_WINDOW := 0.080
const GOOD_WINDOW := 0.180
const POINTS_PER_PIECE := 100
const CHAIN_STEP := 0.12
const COMBO_STEP := 0.025
const COMBO_CAP := 2.0
const LONG_CHAIN := 7
const LONG_PERFECT_MULTIPLIER := 1.25
const TIMING_MULTIPLIERS := {"PERFECT": 1.0, "GOOD": 0.7, "MISS": 0.1}
const QUIZ_BONUSES := {10: 1.5, 8: 1.3, 5: 1.15, 0: 1.0}
const MILESTONES := [50, 100, 200]
const RANKS := {"SS": 1.0, "S": 0.8, "A": 0.6, "B": 0.35, "C": 0.0}
const COLORS := [Color("ff738c"), Color("69b5ff"), Color("ffcf60"), Color("96dbae"), Color("ba96ff")]
const COLUMNS := 6
const ROWS := 8
const CONNECT_DISTANCE := 1.22
const FALL_SPEED := 12.0
const HINT_DELAY := 5.0

static func quiz_bonus(correct: int) -> float:
	for threshold in QUIZ_BONUSES:
		if correct >= threshold:
			return QUIZ_BONUSES[threshold]
	return 1.0

static func judge(error_seconds: float) -> String:
	if absf(error_seconds) <= PERFECT_WINDOW + 0.000001:
		return "PERFECT"
	if absf(error_seconds) <= GOOD_WINDOW + 0.000001:
		return "GOOD"
	return "MISS"

static func ring_progress(beat: float, bpm: float) -> float:
	# Reach the outside on the beat, remaining there during its PERFECT window.
	var phase := fposmod(beat, 1.0)
	var window := PERFECT_WINDOW / (60.0 / bpm)
	if phase <= window or phase >= 1.0 - window:
		return 1.0
	return lerpf(0.15, 1.0, (phase - window) / (1.0 - 2.0 * window))

static func note_ring_progress(beat: float, due_beat: float, lead_beats: float) -> float:
	return clampf(1.0 + (beat - due_beat) / maxf(lead_beats, 0.01), 0.1, 1.0)

static func rank_for(score: int, target: int) -> String:
	for rank_name in RANKS:
		if float(score) / maxf(target, 1) >= RANKS[rank_name]:
			return rank_name
	return "C"
