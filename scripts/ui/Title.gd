extends ScreenBase

func bind_screen() -> void:
	connect_button("StartButton", _start)
	connect_button("HelpButton", _help)
	connect_button("SettingsButton", _settings)
	connect_button("HelpCloseButton", close_modal)
	connect_button("SettingsCloseButton", _save_settings)
	connect_button("ExitButton", func(): get_tree().quit())
	ui("ExitButton").visible = not OS.has_feature("ios") and not OS.has_feature("web")
	ui("ApproachSlider").value_changed.connect(_approach_changed)
	ui("VolumeSlider").value_changed.connect(_volume_changed)
	ui("OffsetSlider").value_changed.connect(_offset_changed)
	ui("MotionToggle").toggled.connect(func(value: bool): SaveManager.settings.reduced_motion = value)

func _start() -> void:
	MusicManager.unlock()
	GameData.go("MusicSelect")

func _help() -> void:
	open_dialog("HelpDialog")

func _settings() -> void:
	ui("ApproachSlider").set_value_no_signal(float(SaveManager.settings.approach_seconds))
	render("ApproachLabel", {"seconds": "%.1f" % SaveManager.settings.approach_seconds})
	ui("VolumeSlider").set_value_no_signal(float(SaveManager.settings.volume) * 100)
	ui("OffsetSlider").set_value_no_signal(float(SaveManager.settings.offset_ms))
	ui("MotionToggle").set_pressed_no_signal(bool(SaveManager.settings.reduced_motion))
	render("VolumeLabel", {"volume": roundi(float(SaveManager.settings.volume) * 100)})
	render("OffsetLabel", {"offset": "%+d" % int(SaveManager.settings.offset_ms)})
	open_dialog("SettingsDialog")

func _volume_changed(value: float) -> void:
	SaveManager.settings.volume = value / 100.0
	MusicManager.apply_volume()
	render("VolumeLabel", {"volume": int(value)})

func _offset_changed(value: float) -> void:
	SaveManager.settings.offset_ms = value
	render("OffsetLabel", {"offset": "%+d" % int(value)})

func _save_settings() -> void:
	SaveManager.persist()
	close_modal()
	if not SaveManager.last_error.is_empty():
		show_error(SaveManager.last_error)

func _approach_changed(value: float) -> void:
	SaveManager.settings.approach_seconds = value
	render("ApproachLabel", {"seconds": "%.1f" % value})
