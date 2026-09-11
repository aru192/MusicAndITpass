@tool
class_name UI
extends RefCounted

const INK := Color("242738")
const MUTED := Color("75778a")
const PAPER := Color("f6f5f0")
const PURPLE := Color("7760da")
const LIME := Color("d6f49c")
const FONT = preload("res://assets/fonts/NotoSansJP-Regular.ttf")

static func style(color: Color, radius: int = 18, padding: int = 16) -> StyleBoxFlat:
	var box := StyleBoxFlat.new()
	box.bg_color = color
	box.set_corner_radius_all(radius)
	box.content_margin_left = padding
	box.content_margin_right = padding
	box.content_margin_top = padding
	box.content_margin_bottom = padding
	return box

static func animate(node: Control) -> void:
	if SaveManager.settings.reduced_motion:
		return
	node.modulate.a = 0.0
	node.create_tween().tween_property(node, "modulate:a", 1.0, 0.22)
