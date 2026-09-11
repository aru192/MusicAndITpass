extends SceneTree

func _initialize() -> void:
	var file := FileAccess.open("res://THIRD_PARTY_NOTICES.md", FileAccess.WRITE)
	file.store_string("# Third-party notices\n\n## Godot Engine\n\n" + Engine.get_license_text() + "\n\n## Bundled engine components\n")
	var licenses := Engine.get_license_info()
	for key in licenses:
		file.store_string("\n### " + str(key) + "\n\n```text\n" + str(licenses[key]) + "\n```\n")
	file.store_string("\n## Noto Sans JP\n\nSee assets/fonts/OFL.txt for the full SIL Open Font License and copyright notices.\n")
	quit()
