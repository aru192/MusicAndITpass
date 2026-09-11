class_name ScreenBase
extends Control

@export_group("Layout")
@export var content_max_width := 460.0

var content: VBoxContainer
var safe_margin: MarginContainer
var modal_layer: CanvasLayer
var pause_enabled := false
var is_paused := false
var _editor_insets := Vector4.ZERO
var _text_templates: Dictionary = {}

func _ready() -> void:
	content = ui("Content")
	safe_margin = ui("SafeArea")
	_editor_insets = Vector4(safe_margin.get_theme_constant("margin_left"), safe_margin.get_theme_constant("margin_top"), safe_margin.get_theme_constant("margin_right"), safe_margin.get_theme_constant("margin_bottom"))
	resized.connect(_update_safe_area)
	_update_safe_area()
	connect_button("ResumeButton", resume_game)
	connect_button("RestartButton", restart)
	connect_button("PauseMusicButton", func(): GameData.go("MusicSelect"))
	connect_button("PauseTitleButton", func(): GameData.go("Title"))
	connect_button("ErrorCloseButton", close_modal)
	if ui("PauseButton"):
		connect_button("PauseButton", show_pause)
	bind_screen()
	UI.animate(content)

func ui(node_name: String) -> Node:
	return find_child(node_name, true, false)

func connect_button(node_name: String, callback: Callable) -> void:
	var button := ui(node_name) as Button
	if button:
		button.pressed.connect(callback)

func render(node_name: String, values: Dictionary) -> void:
	var node := ui(node_name)
	if not _text_templates.has(node_name):
		_text_templates[node_name] = node.text
	node.text = str(_text_templates[node_name]).format(values)

func bind_screen() -> void:
	pass

func _update_safe_area() -> void:
	if not safe_margin:
		return
	var insets := _editor_insets
	if OS.has_feature("ios") or OS.has_feature("android"):
		var safe := DisplayServer.get_display_safe_area()
		var screen := DisplayServer.screen_get_size()
		if screen.x > 0 and screen.y > 0 and safe.size.x > 0:
			var ratio := size / Vector2(screen)
			insets.x = maxf(insets.x, safe.position.x * ratio.x + 12)
			insets.y = maxf(insets.y, safe.position.y * ratio.y + 12)
			insets.z = maxf(insets.z, (screen.x - safe.end.x) * ratio.x + 12)
			insets.w = maxf(insets.w, (screen.y - safe.end.y) * ratio.y + 12)
	for pair in [["left",insets.x],["top",insets.y],["right",insets.z],["bottom",insets.w]]:
		safe_margin.add_theme_constant_override("margin_" + pair[0], int(pair[1]))
	content.custom_minimum_size.x = minf(maxf(size.x - insets.x - insets.z, 1), content_max_width)

func open_dialog(node_name: String) -> void:
	close_modal()
	modal_layer = ui(node_name) as CanvasLayer
	modal_layer.show()

func close_modal() -> void:
	if is_instance_valid(modal_layer):
		modal_layer.hide()
	modal_layer = null

func show_error(message: String) -> void:
	ui("ErrorMessage").text = message
	open_dialog("ErrorDialog")

func show_pause() -> void:
	if is_paused or not pause_enabled:
		return
	is_paused = true
	on_pause()
	MusicManager.set_paused(true)
	get_tree().paused = true
	open_dialog("PauseDialog")

func resume_game() -> void:
	close_modal()
	get_tree().paused = false
	MusicManager.set_paused(false)
	is_paused = false

func restart() -> void:
	GameData.reset_quiz()
	GameData.go("Quiz")

func on_pause() -> void:
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		if pause_enabled and is_inside_tree():
			show_pause()

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and pause_enabled:
		show_pause()
