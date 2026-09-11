class_name BeatRing
extends Control

var phase := 0.0

func _ready() -> void:
	custom_minimum_size = Vector2(68, 68)
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func _process(_delta: float) -> void:
	if MusicManager.active:
		phase = fposmod(MusicManager.beat_position(), 1.0)
		queue_redraw()

func _draw() -> void:
	var center := size / 2
	var r := minf(size.x, size.y) * 0.38
	draw_circle(center, r, UI.LIME)
	draw_arc(center, r, 0, TAU, 48, UI.INK, 2, true)
	var inner := r * (0.2 + phase * 0.8)
	if SaveManager.settings.reduced_motion:
		inner = r * 0.5
	draw_arc(center, inner, 0, TAU, 48, UI.PURPLE, 3, true)
	if phase < 0.12:
		draw_circle(center, 5, UI.PURPLE)
