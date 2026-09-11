# 完成コード全文

このファイルは実装済みファイルから自動生成しています。コード・Scene・設定・ゲームデータを省略していません。編集後は `python3 tools/generate_docs.py` で更新できます。

## project.godot

```ini
; Engine configuration file.
; It's best edited using the editor UI and not directly,
; since the parameters that go here are not all obvious.
;
; Format:
;   [section] ; section goes between []
;   param=value ; assign values to parameters

config_version=5

[application]

config/name="ITパスポート × パズル × 音楽"
run/main_scene="res://scenes/Title.tscn"
config/features=PackedStringArray("4.7", "GL Compatibility")
run/max_fps=60
boot_splash/bg_color=Color(0.965, 0.961, 0.941, 1)
boot_splash/show_image=false
config/icon="res://assets/images/icon.svg"
run/main_scene.qa="res://tests/RunTests.tscn"

[autoload]

SaveManager="*res://scripts/SaveManager.gd"
GameData="*res://scripts/GameData.gd"
MusicManager="*res://scripts/MusicManager.gd"

[display]

window/size/viewport_width=390
window/size/viewport_height=844
window/size/window_width_override=390
window/size/window_height_override=844
window/stretch/mode="canvas_items"
window/stretch/aspect="expand"
window/handheld/orientation=1

[gui]

theme/default_font="res://assets/fonts/NotoSansJP-Regular.ttf"

[rendering]

renderer/rendering_method="gl_compatibility"
renderer/rendering_method.mobile="gl_compatibility"
environment/defaults/default_clear_color=Color(0.055, 0.063, 0.11, 1)
```

## export_presets.cfg

```ini
[preset.0]

name="Web"
platform="Web"
runnable=true
advanced_options=false
dedicated_server=false
custom_features=""
export_filter="all_resources"
include_filter="resources/**/*.json,assets/fonts/OFL.txt,THIRD_PARTY_NOTICES.md"
exclude_filter="docs/*,tests/*,tools/*,build/*"
export_path="build/web/index.html"
script_export_mode=2

[preset.0.options]

custom_template/debug=""
custom_template/release=""
variant/extensions_support=false
variant/thread_support=false
vram_texture_compression/for_desktop=true
vram_texture_compression/for_mobile=false
html/export_icon=true
html/custom_html_shell=""
html/head_include="<meta name=\"theme-color\" content=\"#f6f5f0\">"
html/canvas_resize_policy=2
html/focus_canvas_on_start=true
html/experimental_virtual_keyboard=false
progressive_web_app/enabled=false

[preset.1]

name="iOS"
platform="iOS"
runnable=false
advanced_options=false
dedicated_server=false
custom_features=""
export_filter="all_resources"
include_filter="resources/**/*.json,assets/fonts/OFL.txt,THIRD_PARTY_NOTICES.md"
exclude_filter="docs/*,tests/*,tools/*,build/*"
export_path="build/ios/ITmusic.zip"
script_export_mode=2

[preset.1.options]

custom_template/debug=""
custom_template/release=""
architectures/arm64=true
application/app_store_team_id=""
application/bundle_identifier="com.example.itmusic"
application/signature=""
application/short_version="1.0"
application/version="1"
application/export_project_only=true
application/targeted_device_family=0
capabilities/access_wifi=false
capabilities/push_notifications=false
user_data/accessible_from_files_app=false
user_data/accessible_from_itunes_sharing=false

[preset.2]

name="Web QA"
platform="Web"
runnable=false
advanced_options=false
dedicated_server=false
custom_features="qa"
export_filter="all_resources"
include_filter="resources/**/*.json,assets/fonts/OFL.txt,THIRD_PARTY_NOTICES.md"
exclude_filter="docs/*,tools/*,build/*"
export_path="build/web/qa/index.html"
script_export_mode=2

[preset.2.options]

custom_template/debug=""
custom_template/release=""
variant/extensions_support=false
variant/thread_support=false
vram_texture_compression/for_desktop=true
vram_texture_compression/for_mobile=false
html/export_icon=true
html/custom_html_shell=""
html/head_include="<meta name=\"theme-color\" content=\"#f6f5f0\">"
html/canvas_resize_policy=2
html/focus_canvas_on_start=true
html/experimental_virtual_keyboard=false
progressive_web_app/enabled=false
```

## scenes/Countdown.tscn

```ini
[gd_scene format=3]

[ext_resource type="Script" path="res://scripts/ui/Countdown.gd" id="1"]
[ext_resource type="FontFile" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_7foeq"]

[sub_resource type="Theme" id="Theme_7foeq"]
default_font = ExtResource("2_7foeq")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vcxug"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7wovf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jxnca"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bm8qg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_htfvg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_d4cm4"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_sf4xv"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_l16wr"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_cs8t3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6gust"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kfsl4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8e76k"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_eo2ug"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tlpcc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0aq1q"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_b1ou0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_v2njf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xt6dl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ekp3g"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_of0fv"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_icoxd"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_586wk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1e2fo"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nfqa3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1v5hj"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kqty7"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mdvgc"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_j6r2y"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_j2uoo"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xf6bd"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_o0wtj"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_hskgx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[node name="Countdown" type="Control" unique_id=342684880]
layout_mode = 3
anchors_preset = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_7foeq")
script = ExtResource("1")

[node name="Background" type="ColorRect" parent="." unique_id=167479291]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=1078226145]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=1158416811]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=1840039297]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=955991220]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Header" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=366136362]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Header" unique_id=1534907894]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "READY TO PLAY"
vertical_alignment = 1
autowrap_mode = 3

[node name="PauseButton" type="Button" parent="SafeArea/Center/Content/Header" unique_id=1903621328]
custom_minimum_size = Vector2(44, 44)
layout_mode = 2
tooltip_text = "一時停止"
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_vcxug")
theme_override_styles/pressed = SubResource("StyleBoxFlat_7wovf")
theme_override_styles/hover = SubResource("StyleBoxFlat_jxnca")
theme_override_styles/disabled = SubResource("StyleBoxFlat_bm8qg")
theme_override_styles/focus = SubResource("StyleBoxFlat_htfvg")
text = "Ⅱ"

[node name="Spacer1" type="Control" parent="SafeArea/Center/Content" unique_id=849064763]
layout_mode = 2
size_flags_vertical = 3
mouse_filter = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content" unique_id=193715451]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 13
text = "QUIZ COMPLETE"
horizontal_alignment = 1
autowrap_mode = 3

[node name="QuizSummary" type="Label" parent="SafeArea/Center/Content" unique_id=212474553]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 32
text = "{correct} / 10 正解"
horizontal_alignment = 1
autowrap_mode = 3

[node name="BonusSummary" type="Label" parent="SafeArea/Center/Content" unique_id=1476436993]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 17
text = "スコアボーナス ×{bonus}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="CountLabel" type="Label" parent="SafeArea/Center/Content" unique_id=2061147851]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 104
text = "3"
horizontal_alignment = 1
autowrap_mode = 3

[node name="SongSummary" type="Label" parent="SafeArea/Center/Content" unique_id=519155121]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 18
text = "{title}
{bpm} BPM"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer2" type="Control" parent="SafeArea/Center/Content" unique_id=1825197059]
layout_mode = 2
size_flags_vertical = 3
mouse_filter = 2

[node name="Text2" type="Label" parent="SafeArea/Center/Content" unique_id=643029018]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 14
text = "丸の中の輪が重なったら、タップ。"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=303269291]
layout_mode = 2
size_flags_horizontal = 3

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=885397184]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=1702035262]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=556945906]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_7foeq")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=1784060294]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=1053566066]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_d4cm4")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=584708123]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=371850513]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=586774208]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1304130719]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=996463168]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_sf4xv")
theme_override_styles/pressed = SubResource("StyleBoxFlat_l16wr")
theme_override_styles/hover = SubResource("StyleBoxFlat_cs8t3")
theme_override_styles/disabled = SubResource("StyleBoxFlat_6gust")
theme_override_styles/focus = SubResource("StyleBoxFlat_kfsl4")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1426133350]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_8e76k")
theme_override_styles/pressed = SubResource("StyleBoxFlat_eo2ug")
theme_override_styles/hover = SubResource("StyleBoxFlat_tlpcc")
theme_override_styles/disabled = SubResource("StyleBoxFlat_0aq1q")
theme_override_styles/focus = SubResource("StyleBoxFlat_b1ou0")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=2124122462]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_v2njf")
theme_override_styles/pressed = SubResource("StyleBoxFlat_xt6dl")
theme_override_styles/hover = SubResource("StyleBoxFlat_ekp3g")
theme_override_styles/disabled = SubResource("StyleBoxFlat_of0fv")
theme_override_styles/focus = SubResource("StyleBoxFlat_icoxd")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1212568987]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_586wk")
theme_override_styles/pressed = SubResource("StyleBoxFlat_1e2fo")
theme_override_styles/hover = SubResource("StyleBoxFlat_nfqa3")
theme_override_styles/disabled = SubResource("StyleBoxFlat_1v5hj")
theme_override_styles/focus = SubResource("StyleBoxFlat_kqty7")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=830386957]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=1839407810]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=93047601]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_7foeq")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=1256459581]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=52770607]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_mdvgc")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=912091500]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=2126826592]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=892872089]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1209626596]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1956539206]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_j6r2y")
theme_override_styles/pressed = SubResource("StyleBoxFlat_j2uoo")
theme_override_styles/hover = SubResource("StyleBoxFlat_xf6bd")
theme_override_styles/disabled = SubResource("StyleBoxFlat_o0wtj")
theme_override_styles/focus = SubResource("StyleBoxFlat_hskgx")
text = "閉じる"
```

## scenes/Game.tscn

```ini
[gd_scene format=3]

[ext_resource type="Script" path="res://scripts/ui/Game.gd" id="1"]
[ext_resource type="FontFile" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_cpr0p"]
[ext_resource type="Texture2D" path="res://assets/images/mint_circuit.svg" id="3_78awf"]
[ext_resource type="Script" path="res://scripts/PuzzleManager.gd" id="4_78awf"]

[sub_resource type="Theme" id="Theme_s0nni"]
default_font = ExtResource("2_cpr0p")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_aug50"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kiw3p"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_400sg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_g4kob"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qy1jj"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_3xj3m"]
content_margin_left = 0.0
content_margin_top = 0.0
content_margin_right = 0.0
content_margin_bottom = 0.0
bg_color = Color(0.88235295, 0.87058824, 0.91764706, 1)
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mcffj"]
content_margin_left = 0.0
content_margin_top = 0.0
content_margin_right = 0.0
content_margin_bottom = 0.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_2rd6h"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7ua8r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_r7sob"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_y5y3l"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vjgi4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kyk2p"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_45i86"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_sv1m6"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_a8wo8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_attvq"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bneo8"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ocgqw"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jbgew"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_a85ww"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jhsr3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0bq3a"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_754j2"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_i4jil"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jai3c"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1gdd5"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_426vi"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_naigu"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_m1oc7"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kbe8o"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7f8l2"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_cxum0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1fiys"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_m2g6u"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_27c7x"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ho5ir"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_evnk2"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ca228"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_lscvm"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xfjuk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6h74c"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_pn7ev"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0wf52"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[node name="Game" type="Control" unique_id=629407512]
layout_mode = 3
anchors_preset = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_s0nni")
script = ExtResource("1")

[node name="Background" type="ColorRect" parent="." unique_id=2033349297]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=690922542]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=2039265275]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=359880632]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=1576553997]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Header" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=1337311171]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Header" unique_id=1288051175]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "LINK THE BEAT"
vertical_alignment = 1
autowrap_mode = 3

[node name="PauseButton" type="Button" parent="SafeArea/Center/Content/Header" unique_id=831939695]
custom_minimum_size = Vector2(44, 44)
layout_mode = 2
tooltip_text = "一時停止"
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_aug50")
theme_override_styles/pressed = SubResource("StyleBoxFlat_kiw3p")
theme_override_styles/hover = SubResource("StyleBoxFlat_400sg")
theme_override_styles/disabled = SubResource("StyleBoxFlat_g4kob")
theme_override_styles/focus = SubResource("StyleBoxFlat_qy1jj")
text = "Ⅱ"

[node name="SongRow" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=2030265301]
layout_mode = 2

[node name="SongJacket" type="TextureRect" parent="SafeArea/Center/Content/SongRow" unique_id=280828022]
custom_minimum_size = Vector2(56, 56)
layout_mode = 2
texture = ExtResource("3_78awf")
expand_mode = 1
stretch_mode = 5

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/SongRow" unique_id=540361100]
layout_mode = 2
size_flags_horizontal = 3

[node name="SongTitle" type="Label" parent="SafeArea/Center/Content/SongRow/Column1" unique_id=897278455]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 19
text = "{title}"
autowrap_mode = 3

[node name="SongInfo" type="Label" parent="SafeArea/Center/Content/SongRow/Column1" unique_id=1796257959]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 11
text = "{difficulty} · {bpm} BPM"
autowrap_mode = 3

[node name="ComboLabel" type="Label" parent="SafeArea/Center/Content/SongRow" unique_id=2010976898]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 18
text = "{combo}
COMBO"
horizontal_alignment = 1

[node name="ScoreRow" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=2077579061]
layout_mode = 2

[node name="ScoreLabel" type="Label" parent="SafeArea/Center/Content/ScoreRow" unique_id=1940835861]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 32
text = "{score}"
autowrap_mode = 3

[node name="TimeLabel" type="Label" parent="SafeArea/Center/Content/ScoreRow" unique_id=1066233128]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 12
text = "0:48"
vertical_alignment = 1

[node name="SongProgress" type="ProgressBar" parent="SafeArea/Center/Content" unique_id=399689209]
custom_minimum_size = Vector2(0, 5)
layout_mode = 2
theme_override_styles/background = SubResource("StyleBoxFlat_3xj3m")
theme_override_styles/fill = SubResource("StyleBoxFlat_mcffj")
value = 0.09
show_percentage = false

[node name="Row4" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=194654288]
layout_mode = 2

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/Row4" unique_id=553796725]
layout_mode = 2
size_flags_horizontal = 3

[node name="Judgment" type="Label" parent="SafeArea/Center/Content/Row4/Column1" unique_id=609127030]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 18
text = "輪が出た丸を、拍でタップ"
autowrap_mode = 3

[node name="ChainLabel" type="Label" parent="SafeArea/Center/Content/Row4/Column1" unique_id=1762153294]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 12
text = "内側の輪が外周と重なったら押そう"
autowrap_mode = 3

[node name="PuzzleField" type="Control" parent="SafeArea/Center/Content" unique_id=583661960]
custom_minimum_size = Vector2(0, 320)
clip_contents = true
layout_mode = 2
size_flags_vertical = 3
script = ExtResource("4_78awf")

[node name="Actions" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=347115004]
layout_mode = 2

[node name="ResetChainButton" type="Button" parent="SafeArea/Center/Content/Actions" unique_id=1279806670]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
size_flags_horizontal = 3
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_2rd6h")
theme_override_styles/pressed = SubResource("StyleBoxFlat_7ua8r")
theme_override_styles/hover = SubResource("StyleBoxFlat_r7sob")
theme_override_styles/disabled = SubResource("StyleBoxFlat_y5y3l")
theme_override_styles/focus = SubResource("StyleBoxFlat_vjgi4")
text = "つなぎ直す"

[node name="ClearButton" type="Button" parent="SafeArea/Center/Content/Actions" unique_id=1646532217]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
size_flags_horizontal = 3
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_kyk2p")
theme_override_styles/pressed = SubResource("StyleBoxFlat_45i86")
theme_override_styles/hover = SubResource("StyleBoxFlat_sv1m6")
theme_override_styles/disabled = SubResource("StyleBoxFlat_a8wo8")
theme_override_styles/focus = SubResource("StyleBoxFlat_attvq")
disabled = true
text = "3個以上で消す"

[node name="Stats" type="Label" parent="SafeArea/Center/Content" unique_id=288074839]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 12
text = "PERFECT {perfect}     GOOD {good}     MISS {miss}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="BoostLabel" type="Label" parent="SafeArea/Center/Content" unique_id=2066952144]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 11
text = "QUIZ BOOST ×{bonus}  ·  {interval}拍ごとに出現"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=724496149]
layout_mode = 2
size_flags_horizontal = 3

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=1214046232]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=370237820]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=1253616328]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_s0nni")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=938464226]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=146011088]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_bneo8")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=1105745998]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=178590485]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1831477937]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1551665051]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1370486894]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_ocgqw")
theme_override_styles/pressed = SubResource("StyleBoxFlat_jbgew")
theme_override_styles/hover = SubResource("StyleBoxFlat_a85ww")
theme_override_styles/disabled = SubResource("StyleBoxFlat_jhsr3")
theme_override_styles/focus = SubResource("StyleBoxFlat_0bq3a")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1672376679]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_754j2")
theme_override_styles/pressed = SubResource("StyleBoxFlat_i4jil")
theme_override_styles/hover = SubResource("StyleBoxFlat_jai3c")
theme_override_styles/disabled = SubResource("StyleBoxFlat_1gdd5")
theme_override_styles/focus = SubResource("StyleBoxFlat_426vi")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1815404817]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_naigu")
theme_override_styles/pressed = SubResource("StyleBoxFlat_m1oc7")
theme_override_styles/hover = SubResource("StyleBoxFlat_kbe8o")
theme_override_styles/disabled = SubResource("StyleBoxFlat_7f8l2")
theme_override_styles/focus = SubResource("StyleBoxFlat_cxum0")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=229011667]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_1fiys")
theme_override_styles/pressed = SubResource("StyleBoxFlat_m2g6u")
theme_override_styles/hover = SubResource("StyleBoxFlat_27c7x")
theme_override_styles/disabled = SubResource("StyleBoxFlat_ho5ir")
theme_override_styles/focus = SubResource("StyleBoxFlat_evnk2")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=894729559]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=1610255476]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=1101296091]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_s0nni")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=1176592504]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=350473447]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_ca228")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=166962948]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=2106110103]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1914680129]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=2104582087]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1654914347]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_lscvm")
theme_override_styles/pressed = SubResource("StyleBoxFlat_xfjuk")
theme_override_styles/hover = SubResource("StyleBoxFlat_6h74c")
theme_override_styles/disabled = SubResource("StyleBoxFlat_pn7ev")
theme_override_styles/focus = SubResource("StyleBoxFlat_0wf52")
text = "閉じる"
```

## scenes/MusicSelect.tscn

```ini
[gd_scene format=3]

[ext_resource type="Script" path="res://scripts/ui/MusicSelect.gd" id="1"]
[ext_resource type="FontFile" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_pd5ug"]
[ext_resource type="Texture2D" path="res://assets/images/mint_circuit.svg" id="3_gupmb"]

[sub_resource type="Theme" id="Theme_pd5ug"]
default_font = ExtResource("2_pd5ug")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gupmb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_fc0ga"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_lncjx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wc0aw"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6bnbp"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4erxe"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_5qqdo"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_klnqj"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0nkus"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xkrw4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_md47l"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_od3wy"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_isj88"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_abl1e"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_oepil"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kmaki"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_me65d"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7ecx7"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ixw4d"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8ltul"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_x30gc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_i6gl3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_dva8r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_m26r2"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4j5yf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_674hu"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qgna5"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jc7qg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_16p7w"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ojdan"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wy7fd"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_h8tjn"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6fywf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_pnuda"]
content_margin_left = 16.0
content_margin_top = 16.0
content_margin_right = 16.0
content_margin_bottom = 16.0
bg_color = Color(0.8392157, 0.95686275, 0.6117647, 1)
corner_radius_top_left = 18
corner_radius_top_right = 18
corner_radius_bottom_right = 18
corner_radius_bottom_left = 18

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wevdi"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vbkk0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_oiaxl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_sxr71"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_d0uh1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0i1ed"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7i5my"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_rrjhf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_fp6kb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4i526"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4joyb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8uj5j"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_a2kky"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_fxex5"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_h14ja"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qg1hk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_hdfw3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kuma1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_udt37"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1unf0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_s5kvj"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xchur"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_olov1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_w5hw8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_q7wj3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_sdak3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0ddaj"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_x77nf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_26uoi"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_hnoq8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qh4oq"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_psnnl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[node name="MusicSelect" type="Control" unique_id=2112572690]
layout_mode = 3
anchors_preset = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_pd5ug")
script = ExtResource("1")

[node name="Background" type="ColorRect" parent="." unique_id=795679859]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=2136616269]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=1809456046]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=1046413872]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=1278096963]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Header" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=381482406]
layout_mode = 2

[node name="BackButton" type="Button" parent="SafeArea/Center/Content/Header" unique_id=1345093446]
custom_minimum_size = Vector2(44, 44)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_gupmb")
theme_override_styles/pressed = SubResource("StyleBoxFlat_fc0ga")
theme_override_styles/hover = SubResource("StyleBoxFlat_lncjx")
theme_override_styles/disabled = SubResource("StyleBoxFlat_wc0aw")
theme_override_styles/focus = SubResource("StyleBoxFlat_6bnbp")
text = "‹"

[node name="Heading" type="Label" parent="SafeArea/Center/Content/Header" unique_id=189465014]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "ミュージックセレクト"
vertical_alignment = 1
autowrap_mode = 3

[node name="BodyScroll1" type="ScrollContainer" parent="SafeArea/Center/Content" unique_id=801133646]
layout_mode = 2
size_flags_vertical = 3
horizontal_scroll_mode = 0

[node name="SongDetails" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1" unique_id=1417536867]
layout_mode = 2
size_flags_horizontal = 3
theme_override_constants/separation = 8

[node name="TrackNumber" type="Label" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=2078725158]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 11
text = "TRACK {current} / {total}"
autowrap_mode = 3

[node name="CoverRow" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=1152221751]
layout_mode = 2

[node name="PreviousSongButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/CoverRow" unique_id=1500771829]
custom_minimum_size = Vector2(44, 52)
layout_mode = 2
size_flags_vertical = 4
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_4erxe")
theme_override_styles/pressed = SubResource("StyleBoxFlat_5qqdo")
theme_override_styles/hover = SubResource("StyleBoxFlat_klnqj")
theme_override_styles/disabled = SubResource("StyleBoxFlat_0nkus")
theme_override_styles/focus = SubResource("StyleBoxFlat_xkrw4")
text = "‹"

[node name="SongJacket" type="TextureRect" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/CoverRow" unique_id=559609992]
custom_minimum_size = Vector2(178, 178)
layout_mode = 2
size_flags_horizontal = 3
texture = ExtResource("3_gupmb")
expand_mode = 1
stretch_mode = 5

[node name="NextSongButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/CoverRow" unique_id=181608779]
custom_minimum_size = Vector2(44, 52)
layout_mode = 2
size_flags_vertical = 4
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_md47l")
theme_override_styles/pressed = SubResource("StyleBoxFlat_od3wy")
theme_override_styles/hover = SubResource("StyleBoxFlat_isj88")
theme_override_styles/disabled = SubResource("StyleBoxFlat_abl1e")
theme_override_styles/focus = SubResource("StyleBoxFlat_oepil")
text = "›"

[node name="SongTitle" type="Label" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=210950101]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 27
text = "{title}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="SongArtist" type="Label" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=529840227]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 12
text = "{artist}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="SongInfo" type="Label" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=650786300]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 12
text = "{bpm} BPM  /  {duration}秒"
horizontal_alignment = 1
autowrap_mode = 3

[node name="PreviewButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=467801459]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_kmaki")
theme_override_styles/pressed = SubResource("StyleBoxFlat_me65d")
theme_override_styles/hover = SubResource("StyleBoxFlat_7ecx7")
theme_override_styles/disabled = SubResource("StyleBoxFlat_ixw4d")
theme_override_styles/focus = SubResource("StyleBoxFlat_8ltul")
text = "♪ 試聴する"

[node name="Difficulties" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=1874553311]
layout_mode = 2

[node name="Difficulty0" type="Button" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/Difficulties" unique_id=870888282]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_x30gc")
theme_override_styles/pressed = SubResource("StyleBoxFlat_i6gl3")
theme_override_styles/hover = SubResource("StyleBoxFlat_dva8r")
theme_override_styles/disabled = SubResource("StyleBoxFlat_m26r2")
theme_override_styles/focus = SubResource("StyleBoxFlat_4j5yf")
toggle_mode = true
text = "{name}   Lv.{level}   {interval}拍ごと"

[node name="Difficulty1" type="Button" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/Difficulties" unique_id=1132232831]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_x30gc")
theme_override_styles/pressed = SubResource("StyleBoxFlat_674hu")
theme_override_styles/hover = SubResource("StyleBoxFlat_dva8r")
theme_override_styles/disabled = SubResource("StyleBoxFlat_qgna5")
theme_override_styles/focus = SubResource("StyleBoxFlat_jc7qg")
toggle_mode = true
text = "{name}   Lv.{level}   {interval}拍ごと"

[node name="Difficulty2" type="Button" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/Difficulties" unique_id=1018089182]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_16p7w")
theme_override_styles/pressed = SubResource("StyleBoxFlat_ojdan")
theme_override_styles/hover = SubResource("StyleBoxFlat_wy7fd")
theme_override_styles/disabled = SubResource("StyleBoxFlat_h8tjn")
theme_override_styles/focus = SubResource("StyleBoxFlat_6fywf")
toggle_mode = true
text = "{name}   Lv.{level}   {interval}拍ごと"

[node name="Panel1" type="PanelContainer" parent="SafeArea/Center/Content/BodyScroll1/SongDetails" unique_id=1298505260]
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_pnuda")

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/Panel1" unique_id=1345609707]
layout_mode = 2

[node name="RecordScore" type="Label" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/Panel1/Column1" unique_id=792498184]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 20
text = "HIGH SCORE   {score}"
autowrap_mode = 3

[node name="RecordQuiz" type="Label" parent="SafeArea/Center/Content/BodyScroll1/SongDetails/Panel1/Column1" unique_id=984529411]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 12
text = "QUIZ BEST  {best} / 10   ·   {status}"
autowrap_mode = 3

[node name="PlayButton" type="Button" parent="SafeArea/Center/Content" unique_id=1696694438]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_wevdi")
theme_override_styles/pressed = SubResource("StyleBoxFlat_vbkk0")
theme_override_styles/hover = SubResource("StyleBoxFlat_oiaxl")
theme_override_styles/disabled = SubResource("StyleBoxFlat_sxr71")
theme_override_styles/focus = SubResource("StyleBoxFlat_d0uh1")
text = "この曲であそぶ  →"

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=499839029]
layout_mode = 2
size_flags_horizontal = 3

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=1794580242]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=2007918]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=1921576017]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_pd5ug")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=1495552568]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=1474058667]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_0i1ed")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=1713718794]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=845425124]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1119482475]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=788162132]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=639071043]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_7i5my")
theme_override_styles/pressed = SubResource("StyleBoxFlat_rrjhf")
theme_override_styles/hover = SubResource("StyleBoxFlat_fp6kb")
theme_override_styles/disabled = SubResource("StyleBoxFlat_4i526")
theme_override_styles/focus = SubResource("StyleBoxFlat_4joyb")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=391089225]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_8uj5j")
theme_override_styles/pressed = SubResource("StyleBoxFlat_a2kky")
theme_override_styles/hover = SubResource("StyleBoxFlat_fxex5")
theme_override_styles/disabled = SubResource("StyleBoxFlat_h14ja")
theme_override_styles/focus = SubResource("StyleBoxFlat_qg1hk")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1624350629]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_hdfw3")
theme_override_styles/pressed = SubResource("StyleBoxFlat_kuma1")
theme_override_styles/hover = SubResource("StyleBoxFlat_udt37")
theme_override_styles/disabled = SubResource("StyleBoxFlat_1unf0")
theme_override_styles/focus = SubResource("StyleBoxFlat_s5kvj")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1842361908]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_xchur")
theme_override_styles/pressed = SubResource("StyleBoxFlat_olov1")
theme_override_styles/hover = SubResource("StyleBoxFlat_w5hw8")
theme_override_styles/disabled = SubResource("StyleBoxFlat_q7wj3")
theme_override_styles/focus = SubResource("StyleBoxFlat_sdak3")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=523078889]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=849135568]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=2071022001]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_pd5ug")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=475138859]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=1155415414]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_0ddaj")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=1868973684]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=829154332]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1408750481]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=476400627]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1269657710]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_x77nf")
theme_override_styles/pressed = SubResource("StyleBoxFlat_26uoi")
theme_override_styles/hover = SubResource("StyleBoxFlat_hnoq8")
theme_override_styles/disabled = SubResource("StyleBoxFlat_qh4oq")
theme_override_styles/focus = SubResource("StyleBoxFlat_psnnl")
text = "閉じる"
```

## scenes/Quiz.tscn

```ini
[gd_scene format=3]

[ext_resource type="Script" path="res://scripts/ui/Quiz.gd" id="1"]
[ext_resource type="FontFile" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_lkoqw"]

[sub_resource type="Theme" id="Theme_lkoqw"]
default_font = ExtResource("2_lkoqw")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_io4kd"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0k03f"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_yksy1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_p6167"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_j36u3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ksf2l"]
content_margin_left = 0.0
content_margin_top = 0.0
content_margin_right = 0.0
content_margin_bottom = 0.0
bg_color = Color(0.8980392, 0.8862745, 0.9372549, 1)
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_k7ot1"]
content_margin_left = 0.0
content_margin_top = 0.0
content_margin_right = 0.0
content_margin_bottom = 0.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gjksa"]
content_margin_left = 16.0
content_margin_top = 16.0
content_margin_right = 16.0
content_margin_bottom = 16.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 18
corner_radius_top_right = 18
corner_radius_bottom_right = 18
corner_radius_bottom_left = 18

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1gf7l"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_56wrm"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7xd4x"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jk1f0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_algoh"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mw6tr"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_f7124"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_567b6"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_aw7ek"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jd450"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_2t8se"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tnn83"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ow0hc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_le8bl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tanlc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_caore"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_egeaf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_v11ds"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_foaph"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_p3wui"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_sxs4a"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gibky"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nmv3d"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jrh0r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nrgb8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_f4jll"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ly01m"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_lru86"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_yvw6r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_m8brl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_uiex0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nyify"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_htaby"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_p3pwx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8n73t"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_no6t7"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xj5ni"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1vmh3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_64ljo"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gqh4e"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_y5cww"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_w7pc6"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_y1615"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ea2cv"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vrtyu"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_trmuh"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_p71fb"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jsnpt"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jd3a8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kok1x"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_rdwbs"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ktwhl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxCorrect"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.839216, 0.956863, 0.611765, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_left = 16
corner_radius_bottom_right = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxIncorrect"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 0.854902, 0.882353, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_left = 16
corner_radius_bottom_right = 16

[node name="Quiz" type="Control" unique_id=1229880757]
layout_mode = 3
anchors_preset = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_lkoqw")
script = ExtResource("1")
correct_style = SubResource("StyleBoxCorrect")
incorrect_style = SubResource("StyleBoxIncorrect")

[node name="Background" type="ColorRect" parent="." unique_id=1023056994]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=862780501]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=1003926547]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=249296036]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=765976959]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Header" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=1067310104]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Header" unique_id=614369393]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "ITパスポートクイズ"
vertical_alignment = 1
autowrap_mode = 3

[node name="PauseButton" type="Button" parent="SafeArea/Center/Content/Header" unique_id=1772393629]
custom_minimum_size = Vector2(44, 44)
layout_mode = 2
tooltip_text = "一時停止"
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_io4kd")
theme_override_styles/pressed = SubResource("StyleBoxFlat_0k03f")
theme_override_styles/hover = SubResource("StyleBoxFlat_yksy1")
theme_override_styles/disabled = SubResource("StyleBoxFlat_p6167")
theme_override_styles/focus = SubResource("StyleBoxFlat_j36u3")
text = "Ⅱ"

[node name="QuizProgress" type="ProgressBar" parent="SafeArea/Center/Content" unique_id=1744991346]
custom_minimum_size = Vector2(0, 6)
layout_mode = 2
theme_override_styles/background = SubResource("StyleBoxFlat_ksf2l")
theme_override_styles/fill = SubResource("StyleBoxFlat_k7ot1")
max_value = 10.0
show_percentage = false

[node name="BodyScroll1" type="ScrollContainer" parent="SafeArea/Center/Content" unique_id=1243873822]
layout_mode = 2
size_flags_vertical = 3
horizontal_scroll_mode = 0

[node name="QuestionBody" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1" unique_id=485643244]
layout_mode = 2
size_flags_horizontal = 3

[node name="QuestionInfo" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=1179368380]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 12
text = "QUESTION {number}  /  {genre}"
autowrap_mode = 3

[node name="Panel1" type="PanelContainer" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=211135173]
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_gjksa")

[node name="QuestionCard" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Panel1" unique_id=2016416342]
layout_mode = 2

[node name="QuestionText" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Panel1/QuestionCard" unique_id=792290089]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 21
text = "{question}"
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=826825358]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Answer0" type="Button" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=1969732988]
custom_minimum_size = Vector2(0, 60)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_1gf7l")
theme_override_styles/pressed = SubResource("StyleBoxFlat_56wrm")
theme_override_styles/hover = SubResource("StyleBoxFlat_7xd4x")
theme_override_styles/disabled = SubResource("StyleBoxFlat_jk1f0")
theme_override_styles/focus = SubResource("StyleBoxFlat_algoh")

[node name="Margin1" type="MarginContainer" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer0" unique_id=1806122326]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
theme_override_constants/margin_left = 16
theme_override_constants/margin_top = 12
theme_override_constants/margin_right = 16
theme_override_constants/margin_bottom = 12

[node name="AnswerText0" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer0/Margin1" unique_id=1418561672]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{letter}   {answer}"
vertical_alignment = 1
autowrap_mode = 3

[node name="Answer1" type="Button" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=871493571]
custom_minimum_size = Vector2(0, 60)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_mw6tr")
theme_override_styles/pressed = SubResource("StyleBoxFlat_f7124")
theme_override_styles/hover = SubResource("StyleBoxFlat_567b6")
theme_override_styles/disabled = SubResource("StyleBoxFlat_aw7ek")
theme_override_styles/focus = SubResource("StyleBoxFlat_jd450")

[node name="Margin1" type="MarginContainer" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer1" unique_id=1834328821]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
theme_override_constants/margin_left = 16
theme_override_constants/margin_top = 12
theme_override_constants/margin_right = 16
theme_override_constants/margin_bottom = 12

[node name="AnswerText1" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer1/Margin1" unique_id=1210366888]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{letter}   {answer}"
vertical_alignment = 1
autowrap_mode = 3

[node name="Answer2" type="Button" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=1449811271]
custom_minimum_size = Vector2(0, 60)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_2t8se")
theme_override_styles/pressed = SubResource("StyleBoxFlat_tnn83")
theme_override_styles/hover = SubResource("StyleBoxFlat_ow0hc")
theme_override_styles/disabled = SubResource("StyleBoxFlat_le8bl")
theme_override_styles/focus = SubResource("StyleBoxFlat_tanlc")

[node name="Margin1" type="MarginContainer" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer2" unique_id=1754998576]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
theme_override_constants/margin_left = 16
theme_override_constants/margin_top = 12
theme_override_constants/margin_right = 16
theme_override_constants/margin_bottom = 12

[node name="AnswerText2" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer2/Margin1" unique_id=1015788517]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{letter}   {answer}"
vertical_alignment = 1
autowrap_mode = 3

[node name="Answer3" type="Button" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=2064021661]
custom_minimum_size = Vector2(0, 60)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_caore")
theme_override_styles/pressed = SubResource("StyleBoxFlat_egeaf")
theme_override_styles/hover = SubResource("StyleBoxFlat_v11ds")
theme_override_styles/disabled = SubResource("StyleBoxFlat_foaph")
theme_override_styles/focus = SubResource("StyleBoxFlat_p3wui")

[node name="Margin1" type="MarginContainer" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer3" unique_id=1255335309]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
theme_override_constants/margin_left = 16
theme_override_constants/margin_top = 12
theme_override_constants/margin_right = 16
theme_override_constants/margin_bottom = 12

[node name="AnswerText3" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody/Answer3/Margin1" unique_id=793261297]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{letter}   {answer}"
vertical_alignment = 1
autowrap_mode = 3

[node name="Feedback" type="Label" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=1015065571]
visible = false
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 14
autowrap_mode = 3

[node name="NextButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/QuestionBody" unique_id=781153518]
visible = false
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_sxs4a")
theme_override_styles/pressed = SubResource("StyleBoxFlat_gibky")
theme_override_styles/hover = SubResource("StyleBoxFlat_nmv3d")
theme_override_styles/disabled = SubResource("StyleBoxFlat_jrh0r")
theme_override_styles/focus = SubResource("StyleBoxFlat_nrgb8")
text = "次の問題  →"

[node name="Footer" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=986970943]
layout_mode = 2

[node name="QuestionCount" type="Label" parent="SafeArea/Center/Content/Footer" unique_id=371480124]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 14
text = "{number} / 10"
autowrap_mode = 3

[node name="AnswerCounts" type="Label" parent="SafeArea/Center/Content/Footer" unique_id=1759752823]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 14
text = "○ {correct}     × {wrong}"

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=1249974481]
layout_mode = 2
size_flags_horizontal = 3

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=918969392]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=1446293214]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=718785870]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_lkoqw")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=2088167478]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=1279049793]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_f4jll")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=1001885681]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1615658142]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=182208276]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=809267305]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1640667476]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_ly01m")
theme_override_styles/pressed = SubResource("StyleBoxFlat_lru86")
theme_override_styles/hover = SubResource("StyleBoxFlat_yvw6r")
theme_override_styles/disabled = SubResource("StyleBoxFlat_m8brl")
theme_override_styles/focus = SubResource("StyleBoxFlat_uiex0")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1360475099]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_nyify")
theme_override_styles/pressed = SubResource("StyleBoxFlat_htaby")
theme_override_styles/hover = SubResource("StyleBoxFlat_p3pwx")
theme_override_styles/disabled = SubResource("StyleBoxFlat_8n73t")
theme_override_styles/focus = SubResource("StyleBoxFlat_no6t7")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1370976249]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_xj5ni")
theme_override_styles/pressed = SubResource("StyleBoxFlat_1vmh3")
theme_override_styles/hover = SubResource("StyleBoxFlat_64ljo")
theme_override_styles/disabled = SubResource("StyleBoxFlat_gqh4e")
theme_override_styles/focus = SubResource("StyleBoxFlat_y5cww")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=663955358]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_w7pc6")
theme_override_styles/pressed = SubResource("StyleBoxFlat_y1615")
theme_override_styles/hover = SubResource("StyleBoxFlat_ea2cv")
theme_override_styles/disabled = SubResource("StyleBoxFlat_vrtyu")
theme_override_styles/focus = SubResource("StyleBoxFlat_trmuh")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=1191016972]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=1235739836]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=971086672]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_lkoqw")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=976073114]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=503859647]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_p71fb")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=1274015836]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1948958527]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1428556692]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=585831362]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=452716424]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_jsnpt")
theme_override_styles/pressed = SubResource("StyleBoxFlat_jd3a8")
theme_override_styles/hover = SubResource("StyleBoxFlat_kok1x")
theme_override_styles/disabled = SubResource("StyleBoxFlat_rdwbs")
theme_override_styles/focus = SubResource("StyleBoxFlat_ktwhl")
text = "閉じる"
```

## scenes/QuizSelect.tscn

```ini
[gd_scene format=3]

[ext_resource type="Script" path="res://scripts/ui/QuizSelect.gd" id="1"]
[ext_resource type="FontFile" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_kdk3f"]

[sub_resource type="Theme" id="Theme_kdk3f"]
default_font = ExtResource("2_kdk3f")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_11dbm"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_y2bbn"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ut2th"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mgbd4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1j70h"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_pjqie"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_188dc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_n4l3h"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ufghb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4yof1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_y3vfh"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_occri"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_56x1v"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_84ilk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_b4rgg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_lt3a3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7s4ws"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6oh8h"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_54obr"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_522e5"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ka2y6"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kil4j"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_v107p"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_boniq"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_36s6q"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_rfmlr"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gksvt"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_3m6ce"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_hwrtl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_04xca"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8m81e"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mn7j3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ybp1j"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_i43bm"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_lm7pr"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_iyl6r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wc56s"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bj0lb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_axosr"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_raufm"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qmdha"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8bxx7"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_j4mvl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_fi1d4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_snjw2"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_cy8r3"]
content_margin_left = 16.0
content_margin_top = 16.0
content_margin_right = 16.0
content_margin_bottom = 16.0
bg_color = Color(0.8392157, 0.95686275, 0.6117647, 1)
corner_radius_top_left = 18
corner_radius_top_right = 18
corner_radius_bottom_right = 18
corner_radius_bottom_left = 18

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mmoiq"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_880xl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_j1csl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0666j"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_46vej"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nktgl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_01egi"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_3s7e6"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kyvxg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nty5y"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vcpl5"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qsfu1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0aimg"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kowss"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0j4lo"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_pxvfk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ci75p"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_58y0f"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_umi3b"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xmkpf"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7xh8w"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tabrs"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_yhj7o"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xrnuq"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_kbkxl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nwpoi"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1h01c"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[node name="QuizSelect" type="Control" unique_id=1609924689]
layout_mode = 3
anchors_preset = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_kdk3f")
script = ExtResource("1")

[node name="Background" type="ColorRect" parent="." unique_id=1835584957]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=1718792366]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=1485262490]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=296608796]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=1926901867]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Header" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=1502874885]
layout_mode = 2

[node name="BackButton" type="Button" parent="SafeArea/Center/Content/Header" unique_id=1096239671]
custom_minimum_size = Vector2(44, 44)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_11dbm")
theme_override_styles/pressed = SubResource("StyleBoxFlat_y2bbn")
theme_override_styles/hover = SubResource("StyleBoxFlat_ut2th")
theme_override_styles/disabled = SubResource("StyleBoxFlat_mgbd4")
theme_override_styles/focus = SubResource("StyleBoxFlat_1j70h")
text = "‹"

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Header" unique_id=440340289]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "クイズ選択"
vertical_alignment = 1
autowrap_mode = 3

[node name="Heading" type="Label" parent="SafeArea/Center/Content" unique_id=2045334051]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 28
text = "今日は、何を学ぶ？"
autowrap_mode = 3

[node name="Text1" type="Label" parent="SafeArea/Center/Content" unique_id=1813507004]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "各10問 · 正解するほどスコアアップ"
autowrap_mode = 3

[node name="BodyScroll1" type="ScrollContainer" parent="SafeArea/Center/Content" unique_id=1303839653]
layout_mode = 2
size_flags_vertical = 3
horizontal_scroll_mode = 0

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1" unique_id=1703644804]
layout_mode = 2
size_flags_horizontal = 3

[node name="Genre0" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=773984303]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_pjqie")
theme_override_styles/pressed = SubResource("StyleBoxFlat_188dc")
theme_override_styles/hover = SubResource("StyleBoxFlat_n4l3h")
theme_override_styles/disabled = SubResource("StyleBoxFlat_ufghb")
theme_override_styles/focus = SubResource("StyleBoxFlat_4yof1")
text = "すべてのジャンル   →"
metadata/genre = "all"

[node name="Genre1" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=1645724144]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_y3vfh")
theme_override_styles/pressed = SubResource("StyleBoxFlat_occri")
theme_override_styles/hover = SubResource("StyleBoxFlat_56x1v")
theme_override_styles/disabled = SubResource("StyleBoxFlat_84ilk")
theme_override_styles/focus = SubResource("StyleBoxFlat_b4rgg")
text = "01   ストラテジ   →"
metadata/genre = "ストラテジ"

[node name="Genre2" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=1658295435]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_lt3a3")
theme_override_styles/pressed = SubResource("StyleBoxFlat_7s4ws")
theme_override_styles/hover = SubResource("StyleBoxFlat_6oh8h")
theme_override_styles/disabled = SubResource("StyleBoxFlat_54obr")
theme_override_styles/focus = SubResource("StyleBoxFlat_522e5")
text = "02   マネジメント   →"
metadata/genre = "マネジメント"

[node name="Genre3" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=406173883]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_ka2y6")
theme_override_styles/pressed = SubResource("StyleBoxFlat_kil4j")
theme_override_styles/hover = SubResource("StyleBoxFlat_v107p")
theme_override_styles/disabled = SubResource("StyleBoxFlat_boniq")
theme_override_styles/focus = SubResource("StyleBoxFlat_36s6q")
text = "03   テクノロジ   →"
metadata/genre = "テクノロジ"

[node name="Genre4" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=341222000]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_rfmlr")
theme_override_styles/pressed = SubResource("StyleBoxFlat_gksvt")
theme_override_styles/hover = SubResource("StyleBoxFlat_3m6ce")
theme_override_styles/disabled = SubResource("StyleBoxFlat_hwrtl")
theme_override_styles/focus = SubResource("StyleBoxFlat_04xca")
text = "04   IT基礎   →"
metadata/genre = "IT基礎"

[node name="Genre5" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=1295581804]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_8m81e")
theme_override_styles/pressed = SubResource("StyleBoxFlat_mn7j3")
theme_override_styles/hover = SubResource("StyleBoxFlat_ybp1j")
theme_override_styles/disabled = SubResource("StyleBoxFlat_i43bm")
theme_override_styles/focus = SubResource("StyleBoxFlat_lm7pr")
text = "05   ネットワーク   →"
metadata/genre = "ネットワーク"

[node name="Genre6" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=1264570903]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_iyl6r")
theme_override_styles/pressed = SubResource("StyleBoxFlat_wc56s")
theme_override_styles/hover = SubResource("StyleBoxFlat_bj0lb")
theme_override_styles/disabled = SubResource("StyleBoxFlat_axosr")
theme_override_styles/focus = SubResource("StyleBoxFlat_raufm")
text = "06   セキュリティ   →"
metadata/genre = "セキュリティ"

[node name="Genre7" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=338687487]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_qmdha")
theme_override_styles/pressed = SubResource("StyleBoxFlat_8bxx7")
theme_override_styles/hover = SubResource("StyleBoxFlat_j4mvl")
theme_override_styles/disabled = SubResource("StyleBoxFlat_fi1d4")
theme_override_styles/focus = SubResource("StyleBoxFlat_snjw2")
text = "07   データベース   →"
metadata/genre = "データベース"

[node name="Panel1" type="PanelContainer" parent="SafeArea/Center/Content" unique_id=1607037088]
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_cy8r3")

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/Panel1" unique_id=265061077]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Panel1/Column1" unique_id=754472404]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 12
text = "QUIZ BOOST"
autowrap_mode = 3

[node name="Text2" type="Label" parent="SafeArea/Center/Content/Panel1/Column1" unique_id=100885475]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "5問で ×1.15　8問で ×1.3
全問正解で ×1.5"
autowrap_mode = 3

[node name="Text2" type="Label" parent="SafeArea/Center/Content" unique_id=1167916929]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 11
text = "オリジナル学習問題を収録。公式の過去問ではありません。"
autowrap_mode = 3

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=82559331]
layout_mode = 2
size_flags_horizontal = 3

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=948267805]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=1369249365]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=131815935]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_kdk3f")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=1350676638]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=739679124]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_mmoiq")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=205643155]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1780509462]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=249167189]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=253550146]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=973050559]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_880xl")
theme_override_styles/pressed = SubResource("StyleBoxFlat_j1csl")
theme_override_styles/hover = SubResource("StyleBoxFlat_0666j")
theme_override_styles/disabled = SubResource("StyleBoxFlat_46vej")
theme_override_styles/focus = SubResource("StyleBoxFlat_nktgl")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=834015693]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_01egi")
theme_override_styles/pressed = SubResource("StyleBoxFlat_3s7e6")
theme_override_styles/hover = SubResource("StyleBoxFlat_kyvxg")
theme_override_styles/disabled = SubResource("StyleBoxFlat_nty5y")
theme_override_styles/focus = SubResource("StyleBoxFlat_vcpl5")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1269172536]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_qsfu1")
theme_override_styles/pressed = SubResource("StyleBoxFlat_0aimg")
theme_override_styles/hover = SubResource("StyleBoxFlat_kowss")
theme_override_styles/disabled = SubResource("StyleBoxFlat_0j4lo")
theme_override_styles/focus = SubResource("StyleBoxFlat_pxvfk")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=699709486]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_ci75p")
theme_override_styles/pressed = SubResource("StyleBoxFlat_58y0f")
theme_override_styles/hover = SubResource("StyleBoxFlat_umi3b")
theme_override_styles/disabled = SubResource("StyleBoxFlat_xmkpf")
theme_override_styles/focus = SubResource("StyleBoxFlat_7xh8w")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=1573349097]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=1325788390]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=639910724]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_kdk3f")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=1837592832]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=2121405688]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_tabrs")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=1524083274]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=859461211]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1474860109]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=272545181]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1997217877]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_yhj7o")
theme_override_styles/pressed = SubResource("StyleBoxFlat_xrnuq")
theme_override_styles/hover = SubResource("StyleBoxFlat_kbkxl")
theme_override_styles/disabled = SubResource("StyleBoxFlat_nwpoi")
theme_override_styles/focus = SubResource("StyleBoxFlat_1h01c")
text = "閉じる"
```

## scenes/Result.tscn

```ini
[gd_scene format=3]

[ext_resource type="Script" path="res://scripts/ui/Result.gd" id="1"]
[ext_resource type="FontFile" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_5m3t6"]

[sub_resource type="Theme" id="Theme_5m3t6"]
default_font = ExtResource("2_5m3t6")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ulngk"]
content_margin_left = 16.0
content_margin_top = 16.0
content_margin_right = 16.0
content_margin_bottom = 16.0
bg_color = Color(0.8392157, 0.95686275, 0.6117647, 1)
corner_radius_top_left = 18
corner_radius_top_right = 18
corner_radius_bottom_right = 18
corner_radius_bottom_left = 18

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4ij2v"]
content_margin_left = 16.0
content_margin_top = 16.0
content_margin_right = 16.0
content_margin_bottom = 16.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 18
corner_radius_top_right = 18
corner_radius_bottom_right = 18
corner_radius_bottom_left = 18

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_p5b7d"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bjvqw"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_aibgw"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_l77w1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ycgka"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tipdx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_50w0l"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_iedmk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bdk2b"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4xcn0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6sqep"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_j8npm"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qj06w"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tsvqj"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_lnrqt"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_70qkm"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4phkq"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_07ld1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_dg4nu"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_x1tsy"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jos7o"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_cuyy3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bxi2e"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_v446n"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ojqln"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_utsim"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jrd0y"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6m203"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wy83g"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mpy2k"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6lxit"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1uk4n"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ksoao"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ql6fn"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_aydti"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6ohyc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_0h0sv"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gtmyd"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6e3rt"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_rr3rp"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_8c888"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_2yor3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[node name="Result" type="Control" unique_id=1664653246]
layout_mode = 3
anchors_preset = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_5m3t6")
script = ExtResource("1")

[node name="Background" type="ColorRect" parent="." unique_id=594651514]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=3259402]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=1990055956]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=510214905]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=2128606479]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Row1" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=1800210021]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Row1" unique_id=499356411]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 17
text = "PLAY RESULT"
vertical_alignment = 1
autowrap_mode = 3

[node name="BodyScroll1" type="ScrollContainer" parent="SafeArea/Center/Content" unique_id=942845094]
layout_mode = 2
size_flags_vertical = 3
horizontal_scroll_mode = 0

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1" unique_id=1874691341]
layout_mode = 2
size_flags_horizontal = 3

[node name="SongTitle" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=894511689]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 22
text = "{title}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="DifficultyLabel" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=1113355409]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 12
text = "{difficulty} · Lv.{level}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="RankLabel" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=306199806]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 64
text = "{rank}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="RecordLabel" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=439959003]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 13
text = "NICE SESSION"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Panel1" type="PanelContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=542768212]
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_ulngk")

[node name="ScoreCard" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel1" unique_id=1216266556]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel1/ScoreCard" unique_id=1715719580]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 12
text = "TOTAL SCORE"
horizontal_alignment = 1
autowrap_mode = 3

[node name="TotalScore" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel1/ScoreCard" unique_id=1834093384]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 40
text = "{score}"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Panel2" type="PanelContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1" unique_id=558963425]
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_4ij2v")

[node name="Column1" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2" unique_id=1972128116]
layout_mode = 2
theme_override_constants/separation = 6

[node name="MaxComboRow" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1" unique_id=797461926]
layout_mode = 2

[node name="MaxComboValueCaption" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/MaxComboRow" unique_id=931424697]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "MAX COMBO"
autowrap_mode = 3

[node name="MaxComboValue" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/MaxComboRow" unique_id=941296236]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{combo}"

[node name="Row2" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1" unique_id=230001510]
layout_mode = 2

[node name="LongestChainValueCaption" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row2" unique_id=1980319413]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "LONGEST CHAIN"
autowrap_mode = 3

[node name="LongestChainValue" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row2" unique_id=1060534380]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{chain}"

[node name="Row3" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1" unique_id=1811757993]
layout_mode = 2

[node name="PerfectValueCaption" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row3" unique_id=1130294116]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "PERFECT"
autowrap_mode = 3

[node name="PerfectValue" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row3" unique_id=2108160962]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{perfect}"

[node name="Row4" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1" unique_id=1177224884]
layout_mode = 2

[node name="GoodValueCaption" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row4" unique_id=701785040]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "GOOD"
autowrap_mode = 3

[node name="GoodValue" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row4" unique_id=769374950]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{good}"

[node name="Row5" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1" unique_id=1364540278]
layout_mode = 2

[node name="MissValueCaption" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row5" unique_id=534261665]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "MISS"
autowrap_mode = 3

[node name="MissValue" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row5" unique_id=1240468404]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{miss}"

[node name="Row6" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1" unique_id=281007235]
layout_mode = 2

[node name="QuizScoreValueCaption" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row6" unique_id=32411220]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "QUIZ SCORE"
autowrap_mode = 3

[node name="QuizScoreValue" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Column1/Panel2/Column1/Row6" unique_id=2065493141]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "{correct} / 10"

[node name="ReplayButton" type="Button" parent="SafeArea/Center/Content" unique_id=1572213485]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_p5b7d")
theme_override_styles/pressed = SubResource("StyleBoxFlat_bjvqw")
theme_override_styles/hover = SubResource("StyleBoxFlat_aibgw")
theme_override_styles/disabled = SubResource("StyleBoxFlat_l77w1")
theme_override_styles/focus = SubResource("StyleBoxFlat_ycgka")
text = "もう一度あそぶ  →"

[node name="MusicButton" type="Button" parent="SafeArea/Center/Content" unique_id=1860924263]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_tipdx")
theme_override_styles/pressed = SubResource("StyleBoxFlat_50w0l")
theme_override_styles/hover = SubResource("StyleBoxFlat_iedmk")
theme_override_styles/disabled = SubResource("StyleBoxFlat_bdk2b")
theme_override_styles/focus = SubResource("StyleBoxFlat_4xcn0")
text = "ミュージック選択へ"

[node name="TitleButton" type="Button" parent="SafeArea/Center/Content" unique_id=1550003611]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_6sqep")
theme_override_styles/pressed = SubResource("StyleBoxFlat_j8npm")
theme_override_styles/hover = SubResource("StyleBoxFlat_qj06w")
theme_override_styles/disabled = SubResource("StyleBoxFlat_tsvqj")
theme_override_styles/focus = SubResource("StyleBoxFlat_lnrqt")
text = "タイトルへ"

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=1384821615]
layout_mode = 2
size_flags_horizontal = 3

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=1809797963]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=1318216026]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=1002246461]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_5m3t6")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=530930709]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=1916162894]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_70qkm")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=2058701107]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=942631601]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1142554690]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1486334398]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=49019153]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_4phkq")
theme_override_styles/pressed = SubResource("StyleBoxFlat_07ld1")
theme_override_styles/hover = SubResource("StyleBoxFlat_dg4nu")
theme_override_styles/disabled = SubResource("StyleBoxFlat_x1tsy")
theme_override_styles/focus = SubResource("StyleBoxFlat_jos7o")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=207968037]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_cuyy3")
theme_override_styles/pressed = SubResource("StyleBoxFlat_bxi2e")
theme_override_styles/hover = SubResource("StyleBoxFlat_v446n")
theme_override_styles/disabled = SubResource("StyleBoxFlat_ojqln")
theme_override_styles/focus = SubResource("StyleBoxFlat_utsim")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1574922406]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_jrd0y")
theme_override_styles/pressed = SubResource("StyleBoxFlat_6m203")
theme_override_styles/hover = SubResource("StyleBoxFlat_wy83g")
theme_override_styles/disabled = SubResource("StyleBoxFlat_mpy2k")
theme_override_styles/focus = SubResource("StyleBoxFlat_6lxit")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1936223924]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_1uk4n")
theme_override_styles/pressed = SubResource("StyleBoxFlat_ksoao")
theme_override_styles/hover = SubResource("StyleBoxFlat_ql6fn")
theme_override_styles/disabled = SubResource("StyleBoxFlat_aydti")
theme_override_styles/focus = SubResource("StyleBoxFlat_6ohyc")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=156498041]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=720469790]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=204211122]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_5m3t6")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=1655460011]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=1697347304]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_0h0sv")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=846183362]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1888736232]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=786453711]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1837069991]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=645459019]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_gtmyd")
theme_override_styles/pressed = SubResource("StyleBoxFlat_6e3rt")
theme_override_styles/hover = SubResource("StyleBoxFlat_rr3rp")
theme_override_styles/disabled = SubResource("StyleBoxFlat_8c888")
theme_override_styles/focus = SubResource("StyleBoxFlat_2yor3")
text = "閉じる"
```

## scenes/Title.tscn

```ini
[gd_scene format=3 uid="uid://bq2fsfhdx2dod"]

[ext_resource type="Script" uid="uid://cx6yrdopje1xk" path="res://scripts/ui/Title.gd" id="1"]
[ext_resource type="FontFile" uid="uid://wu8lt8imp3bc" path="res://assets/fonts/NotoSansJP-Regular.ttf" id="2_2sdm5"]
[ext_resource type="Texture2D" uid="uid://mmehuqcbyv71" path="res://assets/images/mint_circuit.svg" id="3_iyajp"]

[sub_resource type="Theme" id="Theme_2sdm5"]
default_font = ExtResource("2_2sdm5")
default_font_size = 15
CheckBox/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckBox/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckBox/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
CheckButton/colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
CheckButton/colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
HBoxContainer/constants/separation = 10
Label/colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
VBoxContainer/constants/separation = 12

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_iyajp"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_aa56r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_agd63"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mh4yb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wq2ky"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_uth7j"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_af2l1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_wiaur"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tydxx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_e2xtt"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qwemb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6ptrc"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6rdx8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ostn1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_l5l45"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_i0bw3"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7copb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_h6qpa"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_450a0"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_usyt4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_83ng8"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_xhb4u"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_pn0ay"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_awox1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_uo2iq"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_33xj2"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_nslpc"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_f4u0r"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_daqq4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_rxdtn"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vn7wy"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ddf2s"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_d3dnu"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qoxrx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_1xrny"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.40600002, 0.32752943, 0.7437647, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_bh3hs"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.43866667, 0.35388237, 0.8036078, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jvwf4"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_gjcie"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jmfbe"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_03ptv"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_plfhb"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_k2omh"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_a5b4s"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_63gyn"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_rw3te"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_uu6d8"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_5ctxk"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_4tfvx"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_7xdyw"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_2t3i1"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jtvd7"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_mynpl"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_jrqwa"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_vvytw"]
content_margin_left = 22.0
content_margin_top = 22.0
content_margin_right = 22.0
content_margin_bottom = 22.0
bg_color = Color(0.9647059, 0.9607843, 0.9411765, 1)
corner_radius_top_left = 24
corner_radius_top_right = 24
corner_radius_bottom_right = 24
corner_radius_bottom_left = 24

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_5b5nw"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_tnv0x"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.87, 0.87, 0.87, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_m6ycs"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.94, 0.94, 0.94, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_r0j86"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(0.9098039, 0.9019608, 0.92941177, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_6vh3x"]
content_margin_left = 12.0
content_margin_top = 12.0
content_margin_right = 12.0
content_margin_bottom = 12.0
bg_color = Color(1, 1, 1, 0)
border_width_left = 2
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
corner_radius_top_left = 16
corner_radius_top_right = 16
corner_radius_bottom_right = 16
corner_radius_bottom_left = 16

[node name="Title" type="Control" unique_id=1362654615]
layout_mode = 3
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_2sdm5")
script = ExtResource("1")

[node name="Background" type="ColorRect" parent="." unique_id=277024216]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color(0.9647059, 0.9607843, 0.9411765, 1)

[node name="SafeArea" type="MarginContainer" parent="." unique_id=1035830364]
layout_mode = 0
anchor_right = 1.0
anchor_bottom = 1.0
theme_override_constants/margin_left = 22
theme_override_constants/margin_top = 22
theme_override_constants/margin_right = 22
theme_override_constants/margin_bottom = 24

[node name="Center" type="HBoxContainer" parent="SafeArea" unique_id=1524042146]
layout_mode = 2
theme_override_constants/separation = 0

[node name="Spacer1" type="Control" parent="SafeArea/Center" unique_id=519363126]
layout_mode = 2
size_flags_horizontal = 3

[node name="Content" type="VBoxContainer" parent="SafeArea/Center" unique_id=382307253]
custom_minimum_size = Vector2(346, 0)
layout_mode = 2

[node name="Row1" type="HBoxContainer" parent="SafeArea/Center/Content" unique_id=18006604]
layout_mode = 2

[node name="Text1" type="Label" parent="SafeArea/Center/Content/Row1" unique_id=215804833]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 20
text = "B / B"
autowrap_mode = 3

[node name="Text2" type="Label" parent="SafeArea/Center/Content/Row1" unique_id=1971157131]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 11
text = "LEARN. LINK. PLAY."

[node name="BodyScroll1" type="ScrollContainer" parent="SafeArea/Center/Content" unique_id=844273672]
layout_mode = 2
size_flags_vertical = 3
horizontal_scroll_mode = 0

[node name="Body" type="VBoxContainer" parent="SafeArea/Center/Content/BodyScroll1" unique_id=1913610949]
layout_mode = 2
size_flags_horizontal = 3

[node name="Spacer1" type="Control" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=488463252]
custom_minimum_size = Vector2(0, 12)
layout_mode = 2
mouse_filter = 2

[node name="Tagline" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=340531803]
layout_mode = 2
theme_override_colors/font_color = Color(0.46666667, 0.3764706, 0.85490197, 1)
theme_override_font_sizes/font_size = 15
text = "知識が、リズムになる。"
autowrap_mode = 3

[node name="TitleText" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=1570006189]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_constants/line_spacing = -18
theme_override_font_sizes/font_size = 64
text = "BIT /
BEAT"
autowrap_mode = 3

[node name="Text1" type="Label" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=1453560489]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 14
text = "ITパスポート × パズル × 音楽"
autowrap_mode = 3

[node name="Spacer2" type="Control" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=107977565]
custom_minimum_size = Vector2(0, 8)
layout_mode = 2
mouse_filter = 2

[node name="TextureRect12" type="TextureRect" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=834907916]
custom_minimum_size = Vector2(160, 160)
layout_mode = 2
size_flags_horizontal = 3
texture = ExtResource("3_iyajp")
expand_mode = 1
stretch_mode = 5

[node name="Spacer3" type="Control" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=640648875]
custom_minimum_size = Vector2(0, 10)
layout_mode = 2
mouse_filter = 2

[node name="StartButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=203514287]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_iyajp")
theme_override_styles/pressed = SubResource("StyleBoxFlat_aa56r")
theme_override_styles/hover = SubResource("StyleBoxFlat_agd63")
theme_override_styles/disabled = SubResource("StyleBoxFlat_mh4yb")
theme_override_styles/focus = SubResource("StyleBoxFlat_wq2ky")
text = "スタート"

[node name="Row1" type="HBoxContainer" parent="SafeArea/Center/Content/BodyScroll1/Body" unique_id=1605667276]
layout_mode = 2

[node name="HelpButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Body/Row1" unique_id=630497768]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
size_flags_horizontal = 3
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_uth7j")
theme_override_styles/pressed = SubResource("StyleBoxFlat_af2l1")
theme_override_styles/hover = SubResource("StyleBoxFlat_wiaur")
theme_override_styles/disabled = SubResource("StyleBoxFlat_tydxx")
theme_override_styles/focus = SubResource("StyleBoxFlat_e2xtt")
text = "遊び方"

[node name="SettingsButton" type="Button" parent="SafeArea/Center/Content/BodyScroll1/Body/Row1" unique_id=1061026964]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
size_flags_horizontal = 3
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_qwemb")
theme_override_styles/pressed = SubResource("StyleBoxFlat_6ptrc")
theme_override_styles/hover = SubResource("StyleBoxFlat_6rdx8")
theme_override_styles/disabled = SubResource("StyleBoxFlat_ostn1")
theme_override_styles/focus = SubResource("StyleBoxFlat_l5l45")
text = "設定"

[node name="Text1" type="Label" parent="SafeArea/Center/Content" unique_id=206410804]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 11
text = "10問のひらめき。ひとつながりのビート。"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ExitButton" type="Button" parent="SafeArea/Center/Content" unique_id=674945433]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_i0bw3")
theme_override_styles/pressed = SubResource("StyleBoxFlat_7copb")
theme_override_styles/hover = SubResource("StyleBoxFlat_h6qpa")
theme_override_styles/disabled = SubResource("StyleBoxFlat_450a0")
theme_override_styles/focus = SubResource("StyleBoxFlat_usyt4")
text = "終了"

[node name="Spacer2" type="Control" parent="SafeArea/Center" unique_id=1689393380]
layout_mode = 2
size_flags_horizontal = 3

[node name="HelpDialog" type="CanvasLayer" parent="." unique_id=970112043]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="HelpDialog" unique_id=58151968]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="HelpDialog" unique_id=1177344174]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_2sdm5")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="HelpDialog/Margin1" unique_id=1003832532]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="HelpDialog/Margin1/Center1" unique_id=1846536368]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_83ng8")

[node name="Column1" type="VBoxContainer" parent="HelpDialog/Margin1/Center1/Panel1" unique_id=183498757]
layout_mode = 2

[node name="HelpHeading" type="Label" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=1008727557]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "遊び方"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=1904757138]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="HelpStep1" type="Label" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=1695386396]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "01  知識をチャージ
ジャンルを選んで4択クイズ10問。正答数に応じてスコアが最大1.5倍に。"
autowrap_mode = 3

[node name="HelpStep2" type="Label" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=1762898859]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "02  輪が出た丸をタップ
タイミングリングはランダムな丸に出現。内側の輪が外周と重なる瞬間に押すとPERFECT！"
autowrap_mode = 3

[node name="HelpStep3" type="Label" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=613428706]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
text = "03  同じ色をつないで消す
隣の同色の丸を、拍に合わせて順番にタップ。指を離しても接続が続きます。3個以上つないだら「消す」を押そう。"
autowrap_mode = 3

[node name="HelpTimingGuide" type="Label" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=1858962220]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 12
text = "出現ペースはBEGINNERが4拍、NORMALが2拍、HARDが1拍ごと。輪のない丸は加点されず、見逃すとMISSになります。"
autowrap_mode = 3

[node name="HelpCloseButton" type="Button" parent="HelpDialog/Margin1/Center1/Panel1/Column1" unique_id=699241229]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_xhb4u")
theme_override_styles/pressed = SubResource("StyleBoxFlat_pn0ay")
theme_override_styles/hover = SubResource("StyleBoxFlat_awox1")
theme_override_styles/disabled = SubResource("StyleBoxFlat_uo2iq")
theme_override_styles/focus = SubResource("StyleBoxFlat_33xj2")
text = "わかった"

[node name="SettingsDialog" type="CanvasLayer" parent="." unique_id=1058245113]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="SettingsDialog" unique_id=1659463366]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="SettingsDialog" unique_id=697902172]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_2sdm5")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="SettingsDialog/Margin1" unique_id=65956717]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="SettingsDialog/Margin1/Center1" unique_id=2104240670]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_nslpc")

[node name="Column1" type="VBoxContainer" parent="SettingsDialog/Margin1/Center1/Panel1" unique_id=1298615126]
layout_mode = 2

[node name="Text1" type="Label" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=96091128]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "設定"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=1542536756]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="VolumeLabel" type="Label" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=1822446606]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 16
text = "音量  {volume}%"
autowrap_mode = 3

[node name="VolumeSlider" type="HSlider" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=706558612]
custom_minimum_size = Vector2(0, 36)
layout_mode = 2
value = 70.0

[node name="OffsetLabel" type="Label" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=457052613]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 16
text = "判定調整  {offset} ms"
autowrap_mode = 3

[node name="OffsetSlider" type="HSlider" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=922544840]
custom_minimum_size = Vector2(0, 36)
layout_mode = 2
min_value = -300.0
max_value = 300.0
step = 5.0

[node name="Text2" type="Label" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=169288050]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 12
text = "＋で判定の拍を遅らせます。音よりリングが早く感じるときは＋へ。"
autowrap_mode = 3

[node name="MotionToggle" type="CheckButton" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=1287304933]
custom_minimum_size = Vector2(0, 48)
layout_mode = 2
button_pressed = true
text = "アニメーションを控えめに"

[node name="SettingsCloseButton" type="Button" parent="SettingsDialog/Margin1/Center1/Panel1/Column1" unique_id=162677152]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_f4u0r")
theme_override_styles/pressed = SubResource("StyleBoxFlat_daqq4")
theme_override_styles/hover = SubResource("StyleBoxFlat_rxdtn")
theme_override_styles/disabled = SubResource("StyleBoxFlat_vn7wy")
theme_override_styles/focus = SubResource("StyleBoxFlat_ddf2s")
text = "保存して閉じる"

[node name="PauseDialog" type="CanvasLayer" parent="." unique_id=1900491873]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="PauseDialog" unique_id=1100542708]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="PauseDialog" unique_id=718709128]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_2sdm5")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="PauseDialog/Margin1" unique_id=789998790]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="PauseDialog/Margin1/Center1" unique_id=144650995]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_d3dnu")

[node name="Column1" type="VBoxContainer" parent="PauseDialog/Margin1/Center1/Panel1" unique_id=1288778195]
layout_mode = 2

[node name="Text1" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=426125807]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "ひとやすみ"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1443328269]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="Text2" type="Label" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=141653373]
layout_mode = 2
theme_override_colors/font_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 13
text = "音楽とゲームを停止しています"
horizontal_alignment = 1
autowrap_mode = 3

[node name="ResumeButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=1264979601]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(1, 1, 1, 1)
theme_override_colors/font_focus_color = Color(1, 1, 1, 1)
theme_override_colors/font_pressed_color = Color(1, 1, 1, 1)
theme_override_colors/font_hover_color = Color(1, 1, 1, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_qoxrx")
theme_override_styles/pressed = SubResource("StyleBoxFlat_1xrny")
theme_override_styles/hover = SubResource("StyleBoxFlat_bh3hs")
theme_override_styles/disabled = SubResource("StyleBoxFlat_jvwf4")
theme_override_styles/focus = SubResource("StyleBoxFlat_gjcie")
text = "再開する"

[node name="RestartButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=425078448]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_jmfbe")
theme_override_styles/pressed = SubResource("StyleBoxFlat_03ptv")
theme_override_styles/hover = SubResource("StyleBoxFlat_plfhb")
theme_override_styles/disabled = SubResource("StyleBoxFlat_k2omh")
theme_override_styles/focus = SubResource("StyleBoxFlat_a5b4s")
text = "ゲームを最初から"

[node name="PauseMusicButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=327512952]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_63gyn")
theme_override_styles/pressed = SubResource("StyleBoxFlat_rw3te")
theme_override_styles/hover = SubResource("StyleBoxFlat_uu6d8")
theme_override_styles/disabled = SubResource("StyleBoxFlat_5ctxk")
theme_override_styles/focus = SubResource("StyleBoxFlat_4tfvx")
text = "ミュージック選択へ"

[node name="PauseTitleButton" type="Button" parent="PauseDialog/Margin1/Center1/Panel1/Column1" unique_id=802976621]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_7xdyw")
theme_override_styles/pressed = SubResource("StyleBoxFlat_2t3i1")
theme_override_styles/hover = SubResource("StyleBoxFlat_jtvd7")
theme_override_styles/disabled = SubResource("StyleBoxFlat_mynpl")
theme_override_styles/focus = SubResource("StyleBoxFlat_jrqwa")
text = "タイトルへ"

[node name="ErrorDialog" type="CanvasLayer" parent="." unique_id=715336824]
process_mode = 3
layer = 10
visible = false

[node name="Shade1" type="ColorRect" parent="ErrorDialog" unique_id=2066357201]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
color = Color(0.08, 0.09, 0.15, 0.72)

[node name="Margin1" type="MarginContainer" parent="ErrorDialog" unique_id=1308749879]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
theme = SubResource("Theme_2sdm5")
theme_override_constants/margin_left = 28
theme_override_constants/margin_top = 28
theme_override_constants/margin_right = 28
theme_override_constants/margin_bottom = 28

[node name="Center1" type="CenterContainer" parent="ErrorDialog/Margin1" unique_id=1360353516]
layout_mode = 2

[node name="Panel1" type="PanelContainer" parent="ErrorDialog/Margin1/Center1" unique_id=844083263]
custom_minimum_size = Vector2(334, 0)
layout_mode = 2
theme_override_styles/panel = SubResource("StyleBoxFlat_vvytw")

[node name="Column1" type="VBoxContainer" parent="ErrorDialog/Margin1/Center1/Panel1" unique_id=1592971571]
layout_mode = 2

[node name="Text1" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=274682428]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 23
text = "エラー"
horizontal_alignment = 1
autowrap_mode = 3

[node name="Spacer1" type="Control" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=440404755]
custom_minimum_size = Vector2(0, 4)
layout_mode = 2
mouse_filter = 2

[node name="ErrorMessage" type="Label" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=1224462090]
layout_mode = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_font_sizes/font_size = 15
autowrap_mode = 3

[node name="ErrorCloseButton" type="Button" parent="ErrorDialog/Margin1/Center1/Panel1/Column1" unique_id=363682668]
custom_minimum_size = Vector2(0, 52)
layout_mode = 2
mouse_default_cursor_shape = 2
theme_override_colors/font_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_focus_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_pressed_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_hover_color = Color(0.14117648, 0.15294118, 0.21960784, 1)
theme_override_colors/font_disabled_color = Color(0.45882353, 0.46666667, 0.5411765, 1)
theme_override_font_sizes/font_size = 15
theme_override_styles/normal = SubResource("StyleBoxFlat_5b5nw")
theme_override_styles/pressed = SubResource("StyleBoxFlat_tnv0x")
theme_override_styles/hover = SubResource("StyleBoxFlat_m6ycs")
theme_override_styles/disabled = SubResource("StyleBoxFlat_r0j86")
theme_override_styles/focus = SubResource("StyleBoxFlat_6vh3x")
text = "閉じる"
```

## scripts/GameBalance.gd

```gdscript
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
```

## scripts/GameData.gd

```gdscript
extends Node

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
```

## scripts/MusicManager.gd

```gdscript
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
	var audio := load(str(song.audio)) as AudioStream
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
```

## scripts/PuzzleManager.gd

```gdscript
@tool
class_name PuzzleManager
extends Control

signal piece_pressed(chain_length: int, error_seconds: float)
signal chain_cleared(count: int)
signal chain_changed(count: int)
signal board_reshuffled
signal note_missed

var pieces: Array[PuzzlePiece] = []
var chain: Array[PuzzlePiece] = []
@export_range(3, 5) var color_count := 5
var spacing := 48.0
var radius := 21.0
var dragging := false
var active_touch := -1
var pointer := Vector2.ZERO
var enabled := true
var settling := false
var idle_time := 0.0
var hint: Array[PuzzlePiece] = []
var rng := RandomNumberGenerator.new()
var line: Line2D
var field_style: StyleBoxFlat
var scheduler := RhythmScheduler.new()
var active_note: PuzzlePiece
var note_due_beat := 0.0
var rhythm_enabled := false
var beat_source: Callable = func() -> float: return MusicManager.beat_position()

func start_rhythm(bpm: float, cadence_beats: float) -> void:
	scheduler.configure(bpm, cadence_beats)
	active_note = null
	rhythm_enabled = true

func _ready() -> void:
	clip_contents = true
	field_style = UI.style(Color("eae7f0"), 26, 0)
	mouse_filter = Control.MOUSE_FILTER_STOP
	custom_minimum_size.y = 320
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	line = Line2D.new()
	line.name = "ConnectionLine"
	line.width = 7
	line.default_color = Color.WHITE
	line.begin_cap_mode = Line2D.LINE_CAP_ROUND
	line.end_cap_mode = Line2D.LINE_CAP_ROUND
	line.joint_mode = Line2D.LINE_JOINT_ROUND
	line.antialiased = true
	add_child(line)
	if Engine.is_editor_hint():
		rng.seed = 42
	else:
		rng.randomize()
	resized.connect(_layout)
	generate()

func generate() -> void:
	pieces.clear()
	cancel_drag()
	for column in GameBalance.COLUMNS:
		for row in GameBalance.ROWS:
			pieces.append(PuzzlePiece.new(rng.randi_range(0, color_count - 1), column, row))
	_layout()

func _slot(column: int, row: int) -> Vector2:
	var total_width := spacing * (GameBalance.COLUMNS - 1)
	var x := (size.x - total_width) / 2.0 + column * spacing
	var y := size.y - radius - 16.0 - row * spacing * 0.90 - (column % 2) * spacing * 0.45
	return Vector2(x, y)

func _layout() -> void:
	if size.x < 30.0 or size.y < 30.0:
		return
	end_drag()
	spacing = minf((size.x - 20) / GameBalance.COLUMNS, (size.y - 28) / (GameBalance.ROWS * 0.9 + 0.55))
	radius = spacing * 0.455
	for piece in pieces:
		piece.target = _slot(piece.column, piece.row)
		piece.position = piece.target
	settling = false
	_update_line()
	ensure_move()
	queue_redraw()

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if not enabled:
		return
	idle_time += delta
	var moving := false
	for piece in pieces:
		if piece.position.distance_squared_to(piece.target) > 0.25:
			piece.position = piece.position.lerp(piece.target, 1.0 - exp(-GameBalance.FALL_SPEED * delta))
			moving = true
		else:
			piece.position = piece.target
	settling = moving
	if rhythm_enabled:
		_update_rhythm(float(beat_source.call()))
	if MusicManager.active or moving or idle_time > GameBalance.HINT_DELAY:
		queue_redraw()

func _draw() -> void:
	draw_style_box(field_style, Rect2(Vector2.ZERO, size))
	var beat := float(beat_source.call()) if rhythm_enabled else 0.0
	for piece in pieces:
		var color: Color = GameBalance.COLORS[piece.color_index]
		var selected := chain.has(piece)
		draw_circle(piece.position + Vector2(0, 3), radius, Color(0.15, 0.13, 0.25, 0.13), true, -1, true)
		draw_circle(piece.position, radius, color, true, -1, true)
		draw_arc(piece.position, radius - 4, PI * 1.15, PI * 1.75, 16, Color(1, 1, 1, 0.55), 2, true)
		# Shape marks keep colors distinguishable without relying on hue alone.
		_draw_mark(piece.position, piece.color_index)
		if piece == active_note:
			var target_radius := radius - 3.0
			var ring := GameBalance.note_ring_progress(beat, note_due_beat, scheduler.lead_beats)
			draw_arc(piece.position, target_radius, 0, TAU, 32, Color.WHITE, 2, true)
			var ring_color := Color.WHITE if absf((beat - note_due_beat) * 60.0 / scheduler.bpm) <= GameBalance.PERFECT_WINDOW else UI.INK
			draw_arc(piece.position, target_radius * ring, 0, TAU, 32, ring_color, 2.2, true)
			draw_arc(piece.position, radius + 2, 0, TAU, 32, UI.PURPLE, 3, true)
		if selected:
			draw_arc(piece.position, radius + 1, 0, TAU, 32, Color.WHITE, 3, true)

func _draw_mark(center: Vector2, color_index: int) -> void:
	var ink := Color(0.12, 0.15, 0.22, 0.55)
	var d := radius * 0.22
	match color_index:
		0:
			draw_circle(center, d, ink)
		1:
			draw_rect(Rect2(center - Vector2(d, d), Vector2(d * 2, d * 2)), ink, false, 2)
		2:
			draw_polyline(PackedVector2Array([center + Vector2(0, -d), center + Vector2(d, d), center + Vector2(-d, d), center + Vector2(0, -d)]), ink, 2, true)
		3:
			draw_line(center - Vector2(d, 0), center + Vector2(d, 0), ink, 2, true)
			draw_line(center - Vector2(0, d), center + Vector2(0, d), ink, 2, true)
		4:
			draw_arc(center, d, 0, TAU, 16, ink, 2, true)

func _gui_input(event: InputEvent) -> void:
	if not enabled or settling:
		return
	if event is InputEventScreenTouch:
		if event.pressed and active_touch == -1:
			active_touch = event.index
			begin_drag(event.position)
			accept_event()
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.device != InputEvent.DEVICE_ID_EMULATION and active_touch == -1 and event.pressed:
			begin_drag(event.position)
			accept_event()

func _input(event: InputEvent) -> void:
	if not dragging:
		return
	if event is InputEventScreenDrag and event.index == active_touch:
		move_drag(get_global_transform_with_canvas().affine_inverse() * event.position)
	elif event is InputEventScreenTouch and event.index == active_touch and not event.pressed:
		end_drag()
	elif active_touch == -1 and event.device != InputEvent.DEVICE_ID_EMULATION:
		if event is InputEventMouseMotion:
			move_drag(get_global_transform_with_canvas().affine_inverse() * event.position)
		elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			end_drag()

func piece_at(point: Vector2) -> PuzzlePiece:
	for piece in pieces:
		if point.distance_squared_to(piece.position) <= radius * radius:
			return piece
	return null

func begin_drag(point: Vector2) -> void:
	if not enabled or settling:
		return
	dragging = true
	pointer = point
	idle_time = 0
	_try_connect(piece_at(point))

func move_drag(point: Vector2) -> void:
	if not dragging:
		return
	# Sample fast movements so pieces between events are not skipped.
	var steps := maxi(1, ceili(pointer.distance_to(point) / maxf(radius * 0.5, 1)))
	steps = mini(steps, 100)
	for i in range(1, steps + 1):
		_try_connect(piece_at(pointer.lerp(point, float(i) / steps)))
	pointer = point

func _try_connect(piece: PuzzlePiece) -> void:
	if piece == null:
		return
	if chain.size() >= 2 and piece == chain[-2]:
		chain.pop_back()
		active_note = null
		_update_line()
		chain_changed.emit(chain.size())
		queue_redraw()
		return
	elif piece != active_note:
		return
	elif chain.has(piece):
		return
	elif chain.is_empty():
		chain.append(piece)
	elif piece.color_index == chain[-1].color_index and adjacent(chain[-1], piece):
		chain.append(piece)
	else:
		return
	var error := (float(beat_source.call()) - note_due_beat) * 60.0 / scheduler.bpm
	active_note = null
	piece_pressed.emit(chain.size(), error)
	_update_line()
	chain_changed.emit(chain.size())
	queue_redraw()

func adjacent(a: PuzzlePiece, b: PuzzlePiece) -> bool:
	return a != b and a.target.distance_to(b.target) <= spacing * GameBalance.CONNECT_DISTANCE

func _update_line() -> void:
	if not line:
		return
	line.clear_points()
	for piece in chain:
		line.add_point(piece.position)

func cancel_drag() -> void:
	end_drag()
	active_note = null
	chain.clear()
	_update_line()
	chain_changed.emit(0)
	queue_redraw()

func end_drag() -> void:
	# Releasing never judges or clears: the next press can continue this chain.
	dragging = false
	active_touch = -1

func clear_chain() -> void:
	if not enabled or settling:
		return
	var count := chain.size()
	if count >= GameBalance.MIN_CHAIN:
		chain_cleared.emit(count)
		for piece in chain:
			pieces.erase(piece)
		cancel_drag()
		_refill()
	idle_time = 0

func _update_rhythm(beat: float) -> void:
	if active_note and (beat - note_due_beat) * 60.0 / scheduler.bpm > GameBalance.GOOD_WINDOW:
		active_note = null
		note_missed.emit()
	var due := scheduler.poll(beat, active_note == null and not settling)
	if is_inf(due):
		return
	var candidates := note_candidates()
	if candidates.is_empty():
		if chain.size() >= GameBalance.MIN_CHAIN:
			clear_chain()
		else:
			cancel_drag()
			ensure_move()
		return
	active_note = candidates[rng.randi_range(0, candidates.size() - 1)]
	note_due_beat = due
	queue_redraw()

func note_candidates() -> Array[PuzzlePiece]:
	var result: Array[PuzzlePiece] = []
	for piece in pieces:
		if chain.has(piece):
			continue
		if not chain.is_empty() and (piece.color_index != chain[-1].color_index or not adjacent(chain[-1], piece)):
			continue
		var blocked: Array[PuzzlePiece] = chain.duplicate()
		blocked.append(piece)
		if _has_tail(piece, blocked, maxi(0, GameBalance.MIN_CHAIN - blocked.size())):
			result.append(piece)
	return result

func _has_tail(from: PuzzlePiece, blocked: Array[PuzzlePiece], needed: int) -> bool:
	if needed == 0:
		return true
	for next in pieces:
		if not blocked.has(next) and next.color_index == from.color_index and adjacent(from, next):
			var visited: Array[PuzzlePiece] = blocked.duplicate()
			visited.append(next)
			if _has_tail(next, visited, needed - 1):
				return true
	return false

func _refill() -> void:
	for column in GameBalance.COLUMNS:
		var remaining: Array[PuzzlePiece] = []
		for piece in pieces:
			if piece.column == column:
				remaining.append(piece)
		remaining.sort_custom(func(a: PuzzlePiece, b: PuzzlePiece): return a.row < b.row)
		for row in remaining.size():
			remaining[row].row = row
			remaining[row].target = _slot(column, row)
		var existing_count := remaining.size()
		for row in range(existing_count, GameBalance.ROWS):
			var piece := PuzzlePiece.new(rng.randi_range(0, color_count - 1), column, row)
			piece.target = _slot(column, row)
			piece.position = Vector2(piece.target.x, -radius - (row - existing_count) * spacing)
			pieces.append(piece)
	ensure_move()
	settling = true
	if SaveManager.settings.reduced_motion:
		for piece in pieces:
			piece.position = piece.target
		settling = false
	queue_redraw()

func find_move() -> Array[PuzzlePiece]:
	for middle in pieces:
		var neighbors: Array[PuzzlePiece] = []
		for piece in pieces:
			if piece.color_index == middle.color_index and adjacent(middle, piece):
				neighbors.append(piece)
				if neighbors.size() == 2:
					return [neighbors[0], middle, neighbors[1]]
	return []

func ensure_move() -> void:
	hint = find_move()
	if not hint.is_empty():
		return
	# Deterministic repair guarantees a legal move, including adversarial boards.
	var color := rng.randi_range(0, color_count - 1)
	for piece in pieces:
		if piece.column == 0 and piece.row < GameBalance.MIN_CHAIN:
			piece.color_index = color
	hint = find_move()
	board_reshuffled.emit()
```

## scripts/PuzzlePiece.gd

```gdscript
@tool
class_name PuzzlePiece
extends RefCounted

var color_index: int
var column: int
var row: int
var position: Vector2
var target: Vector2

func _init(piece_color: int, piece_column: int, piece_row: int) -> void:
	color_index = piece_color
	column = piece_column
	row = piece_row
```

## scripts/QuizManager.gd

```gdscript
class_name QuizManager
extends RefCounted

static func questions() -> Array:
	var data: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://resources/quiz/questions.json"))
	return data if data is Array else []

static func genres() -> Array[String]:
	var result: Array[String] = []
	for question in questions():
		if not result.has(str(question.genre)):
			result.append(str(question.genre))
	return result

static func make_round(genre: String) -> Array:
	var pool: Array = []
	for question in questions():
		if genre == "all" or question.genre == genre:
			pool.append(question.duplicate(true))
	pool.shuffle()
	if pool.size() < GameBalance.QUIZ_COUNT:
		return []
	pool = pool.slice(0, GameBalance.QUIZ_COUNT)
	for question in pool:
		var correct_text: String = question.choices[int(question.answer)]
		question.choices.shuffle()
		question.answer = question.choices.find(correct_text)
	return pool
```

## scripts/RhythmScheduler.gd

```gdscript
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
```

## scripts/SaveManager.gd

```gdscript
extends Node

signal save_failed
var save_path := "user://progress.cfg"
var records: Dictionary = {}
var settings: Dictionary = {"volume": 0.7, "offset_ms": 0.0, "reduced_motion": false}
var last_error := ""

func _ready() -> void:
	load_progress()

func load_progress() -> void:
	var config := ConfigFile.new()
	var error := config.load(save_path)
	if error != OK:
		error = config.load(save_path + ".bak")
	if error != OK:
		return
	var stored: Variant = config.get_value("progress", "records", {})
	if stored is Dictionary:
		records = stored
	settings.volume = clampf(float(config.get_value("settings", "volume", 0.7)), 0.0, 1.0)
	settings.offset_ms = clampf(float(config.get_value("settings", "offset_ms", 0.0)), -300.0, 300.0)
	settings.reduced_motion = bool(config.get_value("settings", "reduced_motion", false))

func record_for(music_id: String, difficulty_id: String) -> Dictionary:
	var value: Variant = records.get(music_id + "/" + difficulty_id, {})
	return value if value is Dictionary else {}

func record_quiz(music_id: String, difficulty_id: String, correct: int) -> void:
	var record := record_for(music_id, difficulty_id).duplicate()
	record["quiz_best"] = maxi(int(record.get("quiz_best", 0)), correct)
	record["quiz_last"] = correct
	records[music_id + "/" + difficulty_id] = record
	persist()

func record_score(music_id: String, difficulty_id: String, score: int, combo: int) -> bool:
	var record := record_for(music_id, difficulty_id).duplicate()
	var is_new := score > int(record.get("score", 0))
	record["score"] = maxi(score, int(record.get("score", 0)))
	record["max_combo"] = maxi(combo, int(record.get("max_combo", 0)))
	record["cleared"] = true
	records[music_id + "/" + difficulty_id] = record
	persist()
	return is_new

func persist() -> void:
	var config := ConfigFile.new()
	config.set_value("progress", "version", 1)
	config.set_value("progress", "records", records)
	for key in settings:
		config.set_value("settings", key, settings[key])
	var error := config.save(save_path + ".tmp")
	if error == OK:
		if FileAccess.file_exists(save_path):
			DirAccess.copy_absolute(save_path, save_path + ".bak")
		error = DirAccess.rename_absolute(save_path + ".tmp", save_path)
	last_error = "" if error == OK else "保存できませんでした。ストレージを確認してください。"
	if error != OK:
		save_failed.emit()
```

## scripts/ScoreManager.gd

```gdscript
class_name ScoreManager
extends RefCounted

static func apply_miss() -> void:
	GameData.miss_count += 1
	GameData.combo = 0

static func apply_hit(chain_length: int, error_seconds: float) -> Dictionary:
	var judgment := GameBalance.judge(error_seconds)
	if judgment == "MISS":
		GameData.combo = 0
		GameData.miss_count += 1
	else:
		GameData.combo += 1
		if judgment == "PERFECT":
			GameData.perfect_count += 1
		else:
			GameData.good_count += 1
	GameData.max_combo = maxi(GameData.max_combo, GameData.combo)
	GameData.longest_chain = maxi(GameData.longest_chain, chain_length)
	var chain_factor := 1.0 + maxf(chain_length - GameBalance.MIN_CHAIN, 0) * GameBalance.CHAIN_STEP
	var combo_factor := minf(1.0 + GameData.combo * GameBalance.COMBO_STEP, GameBalance.COMBO_CAP)
	var points := GameBalance.POINTS_PER_PIECE * float(GameBalance.TIMING_MULTIPLIERS[judgment])
	points *= chain_factor * combo_factor * GameBalance.quiz_bonus(GameData.quiz_correct)
	if chain_length >= GameBalance.LONG_CHAIN and judgment == "PERFECT":
		points *= GameBalance.LONG_PERFECT_MULTIPLIER
	var gained := roundi(points)
	GameData.score += gained
	return {"judgment": judgment, "points": gained, "milestone": GameBalance.MILESTONES.has(GameData.combo)}
```

## scripts/ui/BeatRing.gd

```gdscript
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
```

## scripts/ui/Countdown.gd

```gdscript
extends ScreenBase

@export_group("Display text")
@export var countdown_steps := PackedStringArray(["3", "2", "1"])
@export var start_text := "START"
@export var start_font_size := 65
var count_label: Label

func bind_screen() -> void:
	pause_enabled = true
	count_label = ui("CountLabel")
	render("QuizSummary", {"correct": GameData.quiz_correct})
	render("BonusSummary", {"bonus": "%.2f" % GameBalance.quiz_bonus(GameData.quiz_correct)})
	render("SongSummary", {"title":GameData.music().title, "bpm":GameData.music().bpm})
	_run_countdown()

func _run_countdown() -> void:
	for count in countdown_steps:
		count_label.text = count
		await get_tree().create_timer(1.0, false).timeout
	count_label.text = start_text
	count_label.add_theme_font_size_override("font_size", start_font_size)
	await get_tree().create_timer(0.35, false).timeout
	GameData.reset_game()
	GameData.go("Game")
```

## scripts/ui/Game.gd

```gdscript
extends ScreenBase

@export_group("Display text")
@export var hit_text := "{judgment}  +{points}"
@export var milestone_text := "{combo} COMBO!  +{points}"
@export var chain_text := "{count} CHAIN  ·  次の同色の丸を押そう"
@export var clear_text := "{count}個を消す"
@export var miss_text := "MISS"
@export var refill_text := "つながるピースを補充しました"
@export var audio_error_text := "音源を読み込めません。楽曲データのAudioファイルを確認してください。"
@export_group("Judgment colors")
@export var success_color := Color("7760da")
@export var miss_color := Color("c74d70")

var board: PuzzleManager
var score_label: Label
var combo_label: Label
var judgment: Label
var chain_label: Label
var stats: Label
var time_label: Label
var progress: ProgressBar
var clear_button: Button
var ended := false
var _empty_chain_text := ""
var _clear_disabled_text := ""

func bind_screen() -> void:
	pause_enabled = true
	board = ui("PuzzleField")
	score_label = ui("ScoreLabel")
	combo_label = ui("ComboLabel")
	judgment = ui("Judgment")
	chain_label = ui("ChainLabel")
	stats = ui("Stats")
	time_label = ui("TimeLabel")
	progress = ui("SongProgress")
	clear_button = ui("ClearButton")
	_empty_chain_text = chain_label.text
	_clear_disabled_text = clear_button.text
	render("SongTitle", {"title":GameData.music().title})
	render("SongInfo", {"difficulty":GameData.difficulty().name,"bpm":GameData.music().bpm})
	render("BoostLabel", {"bonus":"%.2f" % GameBalance.quiz_bonus(GameData.quiz_correct),"interval":GameData.difficulty().note_interval_beats})
	ui("SongJacket").texture = load(GameData.music().jacket)
	board.color_count = int(GameData.difficulty().colors)
	board.generate()
	board.piece_pressed.connect(_on_piece_pressed)
	board.note_missed.connect(_on_note_missed)
	board.chain_changed.connect(_on_chain_changed)
	board.board_reshuffled.connect(func(): chain_label.text = refill_text)
	connect_button("ResetChainButton", board.cancel_drag)
	connect_button("ClearButton", board.clear_chain)
	_update_stats()
	MusicManager.song_finished.connect(_finish)
	if not MusicManager.play_song(GameData.music()):
		board.enabled = false
		show_error(audio_error_text)
	else:
		board.start_rhythm(float(GameData.music().bpm), float(GameData.difficulty().note_interval_beats))

func _process(_delta: float) -> void:
	if ended or not MusicManager.active:
		return
	var elapsed := MusicManager.song_position()
	var duration := MusicManager.duration()
	progress.value = elapsed / maxf(duration, 0.1) * 100
	var remaining := maxi(0, ceili(duration - elapsed))
	time_label.text = "%d:%02d" % [remaining / 60, remaining % 60]

func _update_stats() -> void:
	render("ScoreLabel", {"score":"%06d" % GameData.score})
	render("ComboLabel", {"combo":GameData.combo})
	render("Stats", {"perfect":GameData.perfect_count,"good":GameData.good_count,"miss":GameData.miss_count})

func _on_piece_pressed(chain_length: int, error_seconds: float) -> void:
	if ended:
		return
	var result := ScoreManager.apply_hit(chain_length, error_seconds)
	_update_stats()
	judgment.text = (milestone_text if result.milestone else hit_text).format({"judgment": result.judgment, "points":result.points,"combo":GameData.combo})
	judgment.add_theme_color_override("font_color", miss_color if result.judgment == "MISS" else success_color)
	UI.animate(judgment)

func _on_chain_changed(count: int) -> void:
	GameData.longest_chain = maxi(GameData.longest_chain, count)
	chain_label.text = chain_text.format({"count":count}) if count > 0 else _empty_chain_text
	clear_button.disabled = count < GameBalance.MIN_CHAIN
	clear_button.text = clear_text.format({"count":count}) if count >= GameBalance.MIN_CHAIN else _clear_disabled_text

func _on_note_missed() -> void:
	if ended:
		return
	ScoreManager.apply_miss()
	_update_stats()
	judgment.text = miss_text
	judgment.add_theme_color_override("font_color", miss_color)

func on_pause() -> void:
	if board:
		board.end_drag()

func _finish() -> void:
	if ended:
		return
	ended = true
	board.enabled = false
	board.cancel_drag()
	GameData.finish_game()
	GameData.go.call_deferred("Result")
```

## scripts/ui/MusicSelect.gd

```gdscript
extends ScreenBase

@export_group("Display text")
@export var preview_stop_text := "■ 試聴を止める"
@export var audio_error_text := "音源を読み込めませんでした"
@export var cleared_text := "CLEAR"
@export var unplayed_text := "未プレイ"

var details: VBoxContainer
var difficulties: VBoxContainer
var score_label: Label
var quiz_label: Label
var preview_button: Button
var previewing := false
var _preview_text := ""

func bind_screen() -> void:
	details = ui("SongDetails")
	difficulties = ui("Difficulties")
	score_label = ui("RecordScore")
	quiz_label = ui("RecordQuiz")
	preview_button = ui("PreviewButton")
	_preview_text = preview_button.text
	connect_button("BackButton", func(): GameData.go("Title"))
	connect_button("PlayButton", func(): GameData.go("QuizSelect"))
	connect_button("PreviousSongButton", _switch.bind(-1))
	connect_button("NextSongButton", _switch.bind(1))
	connect_button("PreviewButton", _preview)
	for i in difficulties.get_child_count():
		(difficulties.get_child(i) as Button).pressed.connect(_select.bind(i))
	MusicManager.song_finished.connect(_preview_finished)
	_draw_song()

func _draw_song() -> void:
	var song := GameData.music()
	render("TrackNumber", {"current": "%02d" % (GameData.selected_music + 1), "total": "%02d" % GameData.music_catalog.size()})
	ui("SongJacket").texture = load(song.jacket)
	render("SongTitle", {"title": song.title})
	render("SongArtist", {"artist": song.artist})
	render("SongInfo", {"bpm": song.bpm, "duration": roundi(song.duration)})
	preview_button.text = _preview_text
	_draw_difficulties()
	_update_record()

func _draw_difficulties() -> void:
	var options: Array = GameData.music().difficulties
	for i in difficulties.get_child_count():
		var button := difficulties.get_child(i) as Button
		button.visible = i < options.size()
		if not button.visible: continue
		var option: Dictionary = options[i]
		render(str(button.name), {"name":option.name, "level":"%02d" % option.level, "interval":option.note_interval_beats})
		button.set_pressed_no_signal(i == GameData.selected_difficulty)

func _select(index: int) -> void:
	GameData.selected_difficulty = index
	_draw_difficulties()
	_update_record()

func _update_record() -> void:
	var record := SaveManager.record_for(GameData.music().id, GameData.difficulty().id)
	render("RecordScore", {"score": "%06d" % int(record.get("score", 0))})
	render("RecordQuiz", {"best": int(record.get("quiz_best", 0)), "status": cleared_text if record.get("cleared", false) else unplayed_text})

func _switch(direction: int) -> void:
	MusicManager.stop()
	previewing = false
	GameData.selected_music = posmod(GameData.selected_music + direction, GameData.music_catalog.size())
	GameData.selected_difficulty = mini(GameData.selected_difficulty, GameData.music().difficulties.size() - 1)
	_draw_song()

func _preview() -> void:
	if previewing:
		MusicManager.stop()
		_preview_finished()
	else:
		previewing = MusicManager.play_song(GameData.music())
		preview_button.text = preview_stop_text if previewing else audio_error_text

func _preview_finished() -> void:
	previewing = false
	preview_button.text = _preview_text

func _notification(what: int) -> void:
	super._notification(what)
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT and previewing:
		MusicManager.stop()
		_preview_finished()
```

## scripts/ui/Quiz.gd

```gdscript
extends ScreenBase

@export_group("Display text")
@export var final_next_text := "リズムゲームへ  →"
@export_multiline var correct_text := "○ 正解！\n{explanation}"
@export_multiline var incorrect_text := "× 不正解  正解は {answer}\n{explanation}"
@export_multiline var missing_questions_text := "問題が10問に足りません。問題データを確認してください。"
@export_group("Answer styles")
@export var correct_style: StyleBox
@export var incorrect_style: StyleBox

var questions: Array
var index := 0
var answered := false
var body: VBoxContainer
var progress_label: Label
var counts: Label
var answer_buttons: Array[Button] = []
var feedback: Label
var next_button: Button
var progress: ProgressBar
var _next_text := ""
var _disabled_styles: Array[StyleBox] = []

func bind_screen() -> void:
	pause_enabled = true
	questions = QuizManager.make_round(GameData.selected_quiz)
	body = ui("QuestionBody")
	progress_label = ui("QuestionCount")
	counts = ui("AnswerCounts")
	feedback = ui("Feedback")
	next_button = ui("NextButton")
	progress = ui("QuizProgress")
	_next_text = next_button.text
	for i in 4:
		var button := ui("Answer" + str(i)) as Button
		answer_buttons.append(button)
		_disabled_styles.append(button.get_theme_stylebox("disabled"))
		button.pressed.connect(_answer.bind(i))
		var minimum_height := button.custom_minimum_size.y
		var text := ui("AnswerText" + str(i)) as Label
		text.resized.connect(func(): button.custom_minimum_size.y = maxf(minimum_height, text.get_minimum_size().y + 24))
	next_button.pressed.connect(_next)
	if questions.is_empty():
		for button in answer_buttons: button.disabled = true
		show_error(missing_questions_text)
		return
	_draw_question()

func _draw_question() -> void:
	answered = false
	var question: Dictionary = questions[index]
	render("QuestionInfo", {"number":"%02d" % (index + 1), "genre":question.genre})
	render("QuestionText", {"question":question.question})
	for i in 4:
		answer_buttons[i].disabled = false
		answer_buttons[i].add_theme_stylebox_override("disabled", _disabled_styles[i])
		render("AnswerText" + str(i), {"letter":"ABCD"[i], "answer":question.choices[i]})
	feedback.visible = false
	next_button.text = _next_text if index < GameBalance.QUIZ_COUNT - 1 else final_next_text
	next_button.visible = false
	_update_counts()
	(body.get_parent() as ScrollContainer).scroll_vertical = 0

func _answer(choice: int) -> void:
	if answered or questions.is_empty():
		return
	answered = true
	var question: Dictionary = questions[index]
	var correct := choice == int(question.answer)
	if correct:
		GameData.quiz_correct += 1
	else:
		GameData.quiz_wrong += 1
	for i in answer_buttons.size():
		answer_buttons[i].disabled = true
		if i == int(question.answer) and correct_style:
			answer_buttons[i].add_theme_stylebox_override("disabled", correct_style)
		elif i == choice and incorrect_style:
			answer_buttons[i].add_theme_stylebox_override("disabled", incorrect_style)
	feedback.text = (correct_text if correct else incorrect_text).format({"answer":"ABCD"[int(question.answer)], "explanation":question.explanation})
	feedback.visible = true
	next_button.visible = true
	progress.value = index + 1
	_update_counts()
	if index == GameBalance.QUIZ_COUNT - 1:
		SaveManager.record_quiz(GameData.music().id, GameData.difficulty().id, GameData.quiz_correct)
	UI.animate(feedback)

func _next() -> void:
	if not answered:
		return
	index += 1
	if index == GameBalance.QUIZ_COUNT:
		MusicManager.unlock()
		GameData.go("Countdown")
	else:
		_draw_question()

func _update_counts() -> void:
	render("QuestionCount", {"number":index + 1})
	render("AnswerCounts", {"correct":GameData.quiz_correct,"wrong":GameData.quiz_wrong})
```

## scripts/ui/QuizSelect.gd

```gdscript
extends ScreenBase

func bind_screen() -> void:
	connect_button("BackButton", func(): GameData.go("MusicSelect"))
	for button in find_children("Genre*", "Button", true, false):
		button.pressed.connect(_choose.bind(str(button.get_meta("genre", "all"))))

func _choose(genre: String) -> void:
	GameData.selected_quiz = genre
	GameData.reset_quiz()
	GameData.go("Quiz")
```

## scripts/ui/Result.gd

```gdscript
extends ScreenBase

@export_group("Display text")
@export var new_record_text := "NEW RECORD"

func bind_screen() -> void:
	render("SongTitle", {"title":GameData.music().title})
	render("DifficultyLabel", {"difficulty":GameData.difficulty().name,"level":"%02d" % GameData.difficulty().level})
	render("RankLabel", {"rank":GameBalance.rank_for(GameData.score, int(GameData.difficulty().rank_target))})
	if GameData.new_record: ui("RecordLabel").text = new_record_text
	render("TotalScore", {"score":"%06d" % GameData.score})
	var values := {"combo":GameData.max_combo,"chain":GameData.longest_chain,"perfect":GameData.perfect_count,"good":GameData.good_count,"miss":GameData.miss_count,"correct":GameData.quiz_correct}
	for field in ["MaxComboValue","LongestChainValue","PerfectValue","GoodValue","MissValue","QuizScoreValue"]:
		render(field, values)
	connect_button("ReplayButton", func():
		GameData.reset_quiz()
		GameData.go("Quiz"))
	connect_button("MusicButton", func(): GameData.go("MusicSelect"))
	connect_button("TitleButton", func(): GameData.go("Title"))
	if not SaveManager.last_error.is_empty(): show_error(SaveManager.last_error)
```

## scripts/ui/ScreenBase.gd

```gdscript
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
```

## scripts/ui/Title.gd

```gdscript
extends ScreenBase

func bind_screen() -> void:
	connect_button("StartButton", _start)
	connect_button("HelpButton", _help)
	connect_button("SettingsButton", _settings)
	connect_button("HelpCloseButton", close_modal)
	connect_button("SettingsCloseButton", _save_settings)
	connect_button("ExitButton", func(): get_tree().quit())
	ui("ExitButton").visible = not OS.has_feature("ios") and not OS.has_feature("web")
	ui("VolumeSlider").value_changed.connect(_volume_changed)
	ui("OffsetSlider").value_changed.connect(_offset_changed)
	ui("MotionToggle").toggled.connect(func(value: bool): SaveManager.settings.reduced_motion = value)

func _start() -> void:
	MusicManager.unlock()
	GameData.go("MusicSelect")

func _help() -> void:
	open_dialog("HelpDialog")

func _settings() -> void:
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
```

## scripts/ui/UI.gd

```gdscript
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
```

## resources/music/catalog.json

```json
[
  {
    "id": "mint_circuit",
    "title": "Mint Circuit",
    "artist": "BIT / BEAT · Original Demo",
    "bpm": 120,
    "duration": 48.0,
    "beat_offset": 0.0,
    "audio": "res://assets/music/mint_circuit.wav",
    "jacket": "res://assets/images/mint_circuit.svg",
    "difficulties": [
      {
        "id": "beginner",
        "name": "BEGINNER",
        "level": 1,
        "colors": 3,
        "rank_target": 4000,
        "note_interval_beats": 4
      },
      {
        "id": "normal",
        "name": "NORMAL",
        "level": 5,
        "colors": 4,
        "rank_target": 10000,
        "note_interval_beats": 2
      },
      {
        "id": "hard",
        "name": "HARD",
        "level": 10,
        "colors": 5,
        "rank_target": 23000,
        "note_interval_beats": 1
      }
    ]
  },
  {
    "id": "violet_sky",
    "title": "Violet Sky",
    "artist": "BIT / BEAT · Original Demo",
    "bpm": 100,
    "duration": 57.599999999999994,
    "beat_offset": 0.0,
    "audio": "res://assets/music/violet_sky.wav",
    "jacket": "res://assets/images/violet_sky.svg",
    "difficulties": [
      {
        "id": "beginner",
        "name": "BEGINNER",
        "level": 1,
        "colors": 3,
        "rank_target": 4000,
        "note_interval_beats": 4
      },
      {
        "id": "normal",
        "name": "NORMAL",
        "level": 5,
        "colors": 4,
        "rank_target": 10000,
        "note_interval_beats": 2
      },
      {
        "id": "hard",
        "name": "HARD",
        "level": 10,
        "colors": 5,
        "rank_target": 23000,
        "note_interval_beats": 1
      }
    ]
  },
  {
    "id": "peach_signal",
    "title": "Peach Signal",
    "artist": "BIT / BEAT · Original Demo",
    "bpm": 140,
    "duration": 41.14285714285714,
    "beat_offset": 0.0,
    "audio": "res://assets/music/peach_signal.wav",
    "jacket": "res://assets/images/peach_signal.svg",
    "difficulties": [
      {
        "id": "beginner",
        "name": "BEGINNER",
        "level": 1,
        "colors": 3,
        "rank_target": 4000,
        "note_interval_beats": 4
      },
      {
        "id": "normal",
        "name": "NORMAL",
        "level": 5,
        "colors": 4,
        "rank_target": 10000,
        "note_interval_beats": 2
      },
      {
        "id": "hard",
        "name": "HARD",
        "level": 10,
        "colors": 5,
        "rank_target": 23000,
        "note_interval_beats": 1
      }
    ]
  }
]
```

## resources/quiz/questions.json

```json
[
  {
    "id": "1-01",
    "genre": "ストラテジ",
    "question": "SWOT分析で、企業内部のプラス要因に当たるものは？",
    "choices": [
      "強み",
      "機会",
      "脅威",
      "景気動向"
    ],
    "answer": 0,
    "explanation": "SWOTの強み・弱みは内部環境、機会・脅威は外部環境です。"
  },
  {
    "id": "1-02",
    "genre": "ストラテジ",
    "question": "企業の売上から売上原価を引いた利益は？",
    "choices": [
      "売上総利益",
      "営業利益",
      "経常利益",
      "当期純利益"
    ],
    "answer": 0,
    "explanation": "売上総利益は売上高から売上原価を差し引いて求めます。"
  },
  {
    "id": "1-03",
    "genre": "ストラテジ",
    "question": "顧客との関係を管理し、満足度や継続利用の向上を目指す手法は？",
    "choices": [
      "CRM",
      "CPU",
      "DNS",
      "HTML"
    ],
    "answer": 0,
    "explanation": "CRMは顧客情報を活用し、顧客との関係を管理する考え方です。"
  },
  {
    "id": "1-04",
    "genre": "ストラテジ",
    "question": "企業の資源を統合的に管理するシステムは？",
    "choices": [
      "ERP",
      "FTP",
      "LAN",
      "JPEG"
    ],
    "answer": 0,
    "explanation": "ERPは会計・人事・生産などの基幹業務を統合して管理します。"
  },
  {
    "id": "1-05",
    "genre": "ストラテジ",
    "question": "業務プロセスを根本から見直して再設計することは？",
    "choices": [
      "BPR",
      "バックアップ",
      "デフラグ",
      "暗号化"
    ],
    "answer": 0,
    "explanation": "BPRは業務の流れを抜本的に再設計する取り組みです。"
  },
  {
    "id": "1-06",
    "genre": "ストラテジ",
    "question": "事業継続計画を表す略語は？",
    "choices": [
      "BCP",
      "BPM",
      "BASIC",
      "BIOS"
    ],
    "answer": 0,
    "explanation": "BCPは災害などの緊急時にも重要な事業を継続・復旧するための計画です。"
  },
  {
    "id": "1-07",
    "genre": "ストラテジ",
    "question": "企業間で行う電子商取引を表すものは？",
    "choices": [
      "BtoB",
      "BtoC",
      "CtoC",
      "P2P"
    ],
    "answer": 0,
    "explanation": "BtoBは企業と企業の取引、BtoCは企業と消費者の取引です。"
  },
  {
    "id": "1-08",
    "genre": "ストラテジ",
    "question": "目標達成の進み具合を測る重要業績評価指標は？",
    "choices": [
      "KPI",
      "IP",
      "USB",
      "PDF"
    ],
    "answer": 0,
    "explanation": "KPIは目標達成に向けた業務の進捗や成果を測る指標です。"
  },
  {
    "id": "1-09",
    "genre": "ストラテジ",
    "question": "強みを持つ中核業務に集中するため、外部に業務を委託することは？",
    "choices": [
      "アウトソーシング",
      "インストール",
      "キャッシュ",
      "コンパイル"
    ],
    "answer": 0,
    "explanation": "アウトソーシングは業務の一部を外部の専門業者などへ委託することです。"
  },
  {
    "id": "1-10",
    "genre": "ストラテジ",
    "question": "売上高から変動費を引いた額が固定費と等しくなる売上の水準は？",
    "choices": [
      "損益分岐点",
      "時価総額",
      "減価償却額",
      "売掛金残高"
    ],
    "answer": 0,
    "explanation": "損益分岐点では売上高と総費用が等しく、利益がゼロになります。"
  },
  {
    "id": "2-01",
    "genre": "マネジメント",
    "question": "プロジェクトの作業を階層的に分解したものは？",
    "choices": [
      "WBS",
      "DNS",
      "SQL",
      "SSD"
    ],
    "answer": 0,
    "explanation": "WBSは必要な作業を小さな単位へ分解して構造化したものです。"
  },
  {
    "id": "2-02",
    "genre": "マネジメント",
    "question": "サービス提供者と利用者が合意するサービス品質の取り決めは？",
    "choices": [
      "SLA",
      "SSL",
      "SNS",
      "SSD"
    ],
    "answer": 0,
    "explanation": "SLAでは稼働率や応答時間などのサービス水準を取り決めます。"
  },
  {
    "id": "2-03",
    "genre": "マネジメント",
    "question": "計画・実行・評価・改善のサイクルは？",
    "choices": [
      "PDCA",
      "HTML",
      "TCP/IP",
      "FIFO"
    ],
    "answer": 0,
    "explanation": "PDCAはPlan、Do、Check、Actを繰り返し、継続的に改善する考え方です。"
  },
  {
    "id": "2-04",
    "genre": "マネジメント",
    "question": "作業期間を横棒で示し、進捗を把握する図は？",
    "choices": [
      "ガントチャート",
      "円グラフ",
      "散布図",
      "組織図"
    ],
    "answer": 0,
    "explanation": "ガントチャートは時間軸上に作業の開始・終了や進捗を示します。"
  },
  {
    "id": "2-05",
    "genre": "マネジメント",
    "question": "プロジェクト全体の所要期間を決める最長の作業経路は？",
    "choices": [
      "クリティカルパス",
      "ショートカット",
      "相対パス",
      "検索パス"
    ],
    "answer": 0,
    "explanation": "クリティカルパス上の作業が遅れると、原則として全体の完了も遅れます。"
  },
  {
    "id": "2-06",
    "genre": "マネジメント",
    "question": "障害発生後、まずサービスの速やかな復旧を目指す活動は？",
    "choices": [
      "インシデント管理",
      "販売管理",
      "在庫管理",
      "顧客開拓"
    ],
    "answer": 0,
    "explanation": "インシデント管理は中断や品質低下からサービスを早く回復する活動です。"
  },
  {
    "id": "2-07",
    "genre": "マネジメント",
    "question": "障害の根本原因を調査して再発防止を目指す活動は？",
    "choices": [
      "問題管理",
      "給与計算",
      "広告配信",
      "受注処理"
    ],
    "answer": 0,
    "explanation": "問題管理ではインシデントの原因を追究し、再発防止を図ります。"
  },
  {
    "id": "2-08",
    "genre": "マネジメント",
    "question": "第三者の立場から情報システムの管理状況を評価する活動は？",
    "choices": [
      "システム監査",
      "プログラム入力",
      "機器販売",
      "画面設計"
    ],
    "answer": 0,
    "explanation": "システム監査では独立した立場から統制や運用などを検証・評価します。"
  },
  {
    "id": "2-09",
    "genre": "マネジメント",
    "question": "利用者の要求を整理し、システムが満たす条件を決める工程は？",
    "choices": [
      "要件定義",
      "運用監視",
      "廃棄処理",
      "データ消去"
    ],
    "answer": 0,
    "explanation": "要件定義では必要な機能や性能、制約などを明確にします。"
  },
  {
    "id": "2-10",
    "genre": "マネジメント",
    "question": "短い開発期間を繰り返し、フィードバックを反映する開発手法は？",
    "choices": [
      "アジャイル開発",
      "一括償却",
      "単純集計",
      "物理廃棄"
    ],
    "answer": 0,
    "explanation": "アジャイル開発は小さな単位で開発と改善を繰り返します。"
  },
  {
    "id": "3-01",
    "genre": "テクノロジ",
    "question": "情報の最小単位で、0または1を表すものは？",
    "choices": [
      "ビット",
      "バイト",
      "レコード",
      "ファイル"
    ],
    "answer": 0,
    "explanation": "ビットは2通りの状態を表す情報の最小単位です。"
  },
  {
    "id": "3-02",
    "genre": "テクノロジ",
    "question": "1バイトは何ビット？",
    "choices": [
      "8ビット",
      "2ビット",
      "4ビット",
      "16ビット"
    ],
    "answer": 0,
    "explanation": "通常、1バイトは8ビットで、256通りの値を表せます。"
  },
  {
    "id": "3-03",
    "genre": "テクノロジ",
    "question": "2進数の1010を10進数で表すと？",
    "choices": [
      "10",
      "5",
      "8",
      "12"
    ],
    "answer": 0,
    "explanation": "1010は8＋0＋2＋0なので10です。"
  },
  {
    "id": "3-04",
    "genre": "テクノロジ",
    "question": "プログラムの命令を解釈・実行する中心的な装置は？",
    "choices": [
      "CPU",
      "ディスプレイ",
      "キーボード",
      "スピーカー"
    ],
    "answer": 0,
    "explanation": "CPUは演算や制御を行う中央処理装置です。"
  },
  {
    "id": "3-05",
    "genre": "テクノロジ",
    "question": "電源を切ると一般に内容が失われる主記憶は？",
    "choices": [
      "RAM",
      "ROM",
      "SSD",
      "光ディスク"
    ],
    "answer": 0,
    "explanation": "RAMは読み書きできる揮発性メモリとして主記憶に使われます。"
  },
  {
    "id": "3-06",
    "genre": "テクノロジ",
    "question": "処理手順を明確な順序で表したものは？",
    "choices": [
      "アルゴリズム",
      "ライセンス",
      "ドメイン",
      "ジャケット"
    ],
    "answer": 0,
    "explanation": "アルゴリズムは問題を解くための具体的な手順です。"
  },
  {
    "id": "3-07",
    "genre": "テクノロジ",
    "question": "後から入れたデータを先に取り出す構造は？",
    "choices": [
      "スタック",
      "キュー",
      "表計算シート",
      "ディレクトリ"
    ],
    "answer": 0,
    "explanation": "スタックは後入れ先出し（LIFO）でデータを扱います。"
  },
  {
    "id": "3-08",
    "genre": "テクノロジ",
    "question": "先に入れたデータを先に取り出す構造は？",
    "choices": [
      "キュー",
      "スタック",
      "定数",
      "再帰"
    ],
    "answer": 0,
    "explanation": "キューは先入れ先出し（FIFO）でデータを扱います。"
  },
  {
    "id": "3-09",
    "genre": "テクノロジ",
    "question": "整列済みデータの探索範囲を半分ずつ狭める探索法は？",
    "choices": [
      "二分探索",
      "線形探索",
      "総当たり攻撃",
      "ランダム生成"
    ],
    "answer": 0,
    "explanation": "二分探索では中央の値との比較で対象範囲を半分にします。"
  },
  {
    "id": "3-10",
    "genre": "テクノロジ",
    "question": "画像を小さな点の集まりとして表す形式は？",
    "choices": [
      "ラスタ形式",
      "ベクタ形式",
      "ソースコード",
      "音声波形"
    ],
    "answer": 0,
    "explanation": "ラスタ画像は画素の集まりです。ベクタ画像は図形を数式などで表します。"
  },
  {
    "id": "4-01",
    "genre": "IT基礎",
    "question": "ハードウェアを管理し、アプリの実行を支える基本ソフトは？",
    "choices": [
      "OS",
      "表計算ソフト",
      "画像ファイル",
      "Webページ"
    ],
    "answer": 0,
    "explanation": "OSはメモリやファイル、機器などを管理する基本ソフトウェアです。"
  },
  {
    "id": "4-02",
    "genre": "IT基礎",
    "question": "元のデータを別の場所に複製して障害に備えることは？",
    "choices": [
      "バックアップ",
      "フォーマット",
      "上書き保存",
      "アンインストール"
    ],
    "answer": 0,
    "explanation": "バックアップはデータ消失に備えて復元用の複製を作ることです。"
  },
  {
    "id": "4-03",
    "genre": "IT基礎",
    "question": "表計算でセルA1からA5までの合計を求める式は？",
    "choices": [
      "=SUM(A1:A5)",
      "=MAX(A1:A5)",
      "=MIN(A1:A5)",
      "=COUNT(A1:A5)"
    ],
    "answer": 0,
    "explanation": "SUM関数は指定範囲の数値の合計を求めます。"
  },
  {
    "id": "4-04",
    "genre": "IT基礎",
    "question": "表計算で式をコピーしても参照先が変わらない指定は？",
    "choices": [
      "絶対参照",
      "相対参照",
      "循環参照",
      "外部結合"
    ],
    "answer": 0,
    "explanation": "絶対参照は、例えば$A$1のように列と行を固定します。"
  },
  {
    "id": "4-05",
    "genre": "IT基礎",
    "question": "インターネット経由でソフトウェアをサービスとして利用する形態は？",
    "choices": [
      "SaaS",
      "CPU",
      "USB",
      "BIOS"
    ],
    "answer": 0,
    "explanation": "SaaSは提供者が運用するアプリケーションをネットワーク越しに利用する形態です。"
  },
  {
    "id": "4-06",
    "genre": "IT基礎",
    "question": "ソフトウェアの不具合や脆弱性を修正する更新は？",
    "choices": [
      "パッチ",
      "フォルダ",
      "ポート",
      "ピクセル"
    ],
    "answer": 0,
    "explanation": "パッチはソフトウェアの一部を修正するための更新です。"
  },
  {
    "id": "4-07",
    "genre": "IT基礎",
    "question": "人の操作を模して定型的な事務作業を自動化する技術は？",
    "choices": [
      "RPA",
      "RAID",
      "RAM",
      "RGB"
    ],
    "answer": 0,
    "explanation": "RPAは定型的なPC操作などの業務をソフトウェアで自動化します。"
  },
  {
    "id": "4-08",
    "genre": "IT基礎",
    "question": "あらゆる利用者にとって使いやすく利用できるよう配慮することは？",
    "choices": [
      "アクセシビリティ",
      "圧縮率",
      "クロック周波数",
      "解像度"
    ],
    "answer": 0,
    "explanation": "アクセシビリティは障害の有無などによらず情報や機能を利用できる度合いです。"
  },
  {
    "id": "4-09",
    "genre": "IT基礎",
    "question": "異なるシステム間で機能やデータを利用するための窓口となる仕様は？",
    "choices": [
      "API",
      "UPS",
      "HDD",
      "DPI"
    ],
    "answer": 0,
    "explanation": "APIはソフトウェアの機能などを他のプログラムから利用するためのインターフェースです。"
  },
  {
    "id": "4-10",
    "genre": "IT基礎",
    "question": "機器にセンサや通信機能を持たせ、ネットワークにつなぐ考え方は？",
    "choices": [
      "IoT",
      "OCR",
      "GUI",
      "CSV"
    ],
    "answer": 0,
    "explanation": "IoTはさまざまなモノがネットワークを通じて情報をやり取りする仕組みです。"
  },
  {
    "id": "5-01",
    "genre": "ネットワーク",
    "question": "ドメイン名からIPアドレスを調べる仕組みは？",
    "choices": [
      "DNS",
      "CPU",
      "CSV",
      "OCR"
    ],
    "answer": 0,
    "explanation": "DNSはドメイン名とIPアドレスなどを対応付ける仕組みです。"
  },
  {
    "id": "5-02",
    "genre": "ネットワーク",
    "question": "端末にIPアドレスなどを自動で割り当てる仕組みは？",
    "choices": [
      "DHCP",
      "HTML",
      "SMTP",
      "JPEG"
    ],
    "answer": 0,
    "explanation": "DHCPはIPアドレスやネットワーク設定を端末へ自動配布します。"
  },
  {
    "id": "5-03",
    "genre": "ネットワーク",
    "question": "異なるネットワーク間でパケットを中継する装置は？",
    "choices": [
      "ルータ",
      "キーボード",
      "スキャナ",
      "モニタ"
    ],
    "answer": 0,
    "explanation": "ルータは宛先IPアドレスなどに基づいて通信を中継します。"
  },
  {
    "id": "5-04",
    "genre": "ネットワーク",
    "question": "Webページの取得に使われる代表的なプロトコルは？",
    "choices": [
      "HTTP",
      "SMTP",
      "POP3",
      "IMAP"
    ],
    "answer": 0,
    "explanation": "HTTPはWebクライアントとサーバ間で情報をやり取りするためのプロトコルです。"
  },
  {
    "id": "5-05",
    "genre": "ネットワーク",
    "question": "HTTPの通信をTLSで保護する方式は？",
    "choices": [
      "HTTPS",
      "FTP",
      "DHCP",
      "NTP"
    ],
    "answer": 0,
    "explanation": "HTTPSはTLSによってHTTP通信の暗号化やサーバ認証などを行います。"
  },
  {
    "id": "5-06",
    "genre": "ネットワーク",
    "question": "電子メールの送信・転送に使うプロトコルは？",
    "choices": [
      "SMTP",
      "POP3",
      "IMAP",
      "DNS"
    ],
    "answer": 0,
    "explanation": "SMTPは電子メールを送信・転送する際に使われます。"
  },
  {
    "id": "5-07",
    "genre": "ネットワーク",
    "question": "IPv4アドレスの長さは？",
    "choices": [
      "32ビット",
      "8ビット",
      "16ビット",
      "128ビット"
    ],
    "answer": 0,
    "explanation": "IPv4アドレスは32ビット、IPv6アドレスは128ビットです。"
  },
  {
    "id": "5-08",
    "genre": "ネットワーク",
    "question": "建物内など比較的狭い範囲のネットワークは？",
    "choices": [
      "LAN",
      "WAN",
      "CPU",
      "ROM"
    ],
    "answer": 0,
    "explanation": "LANは家庭やオフィスなど限られた範囲のネットワークです。"
  },
  {
    "id": "5-09",
    "genre": "ネットワーク",
    "question": "ネットワーク機器の時刻同期に使うプロトコルは？",
    "choices": [
      "NTP",
      "SMTP",
      "FTP",
      "ARP"
    ],
    "answer": 0,
    "explanation": "NTPはネットワーク経由でコンピュータなどの時刻を合わせます。"
  },
  {
    "id": "5-10",
    "genre": "ネットワーク",
    "question": "一般的なTCPの特徴として適切なものは？",
    "choices": [
      "再送などで信頼性を確保する",
      "暗号化を必ず行う",
      "IPアドレスを自動配布する",
      "ドメイン名を管理する"
    ],
    "answer": 0,
    "explanation": "TCPは順序制御や再送制御などを行います。暗号化そのものはTCPの役割ではありません。"
  },
  {
    "id": "6-01",
    "genre": "セキュリティ",
    "question": "情報セキュリティの3要素に含まれるものは？",
    "choices": [
      "機密性・完全性・可用性",
      "速度・容量・価格",
      "入力・演算・出力",
      "売上・費用・利益"
    ],
    "answer": 0,
    "explanation": "許可された人だけが使える機密性、正確さを保つ完全性、必要時に使える可用性が基本です。"
  },
  {
    "id": "6-02",
    "genre": "セキュリティ",
    "question": "偽のWebサイトへ誘導して認証情報を盗む攻撃は？",
    "choices": [
      "フィッシング",
      "デフラグ",
      "負荷分散",
      "正規化"
    ],
    "answer": 0,
    "explanation": "フィッシングは本物を装ったメールやサイトなどで情報をだまし取ります。"
  },
  {
    "id": "6-03",
    "genre": "セキュリティ",
    "question": "データを暗号化するなどして、復旧と引き換えに金銭を要求するものは？",
    "choices": [
      "ランサムウェア",
      "表計算ソフト",
      "ファイアウォール",
      "コンパイラ"
    ],
    "answer": 0,
    "explanation": "ランサムウェアはファイルの暗号化や端末のロックなどを行い身代金を要求します。"
  },
  {
    "id": "6-04",
    "genre": "セキュリティ",
    "question": "パスワードと指紋を組み合わせた認証は？",
    "choices": [
      "多要素認証",
      "単一要素認証",
      "匿名認証",
      "平文認証"
    ],
    "answer": 0,
    "explanation": "知識情報と生体情報のように異なる種類の要素を組み合わせるのが多要素認証です。"
  },
  {
    "id": "6-05",
    "genre": "セキュリティ",
    "question": "業務に必要な最小限の権限だけを与える原則は？",
    "choices": [
      "最小権限の原則",
      "多数決の原則",
      "全公開の原則",
      "先着順の原則"
    ],
    "answer": 0,
    "explanation": "最小権限にすることで誤操作や不正利用による被害を抑えます。"
  },
  {
    "id": "6-06",
    "genre": "セキュリティ",
    "question": "暗号化と復号に同じ鍵を使う方式は？",
    "choices": [
      "共通鍵暗号方式",
      "公開鍵暗号方式",
      "ハッシュ関数",
      "電子透かし"
    ],
    "answer": 0,
    "explanation": "共通鍵暗号方式では同じ秘密の鍵を使うため、鍵の安全な共有が必要です。"
  },
  {
    "id": "6-07",
    "genre": "セキュリティ",
    "question": "公開鍵暗号で受信者だけが読めるよう暗号化するときに使う鍵は？",
    "choices": [
      "受信者の公開鍵",
      "送信者の公開鍵",
      "受信者のパスワード",
      "全員共通の鍵"
    ],
    "answer": 0,
    "explanation": "受信者の公開鍵で暗号化したデータは対応する受信者の秘密鍵で復号します。"
  },
  {
    "id": "6-08",
    "genre": "セキュリティ",
    "question": "データから固定長の値を計算し、改ざん検出などに使うものは？",
    "choices": [
      "ハッシュ関数",
      "伸長処理",
      "文字装飾",
      "画面回転"
    ],
    "answer": 0,
    "explanation": "ハッシュ値を比較すると、データが変化していないかを確認する手掛かりになります。"
  },
  {
    "id": "6-09",
    "genre": "セキュリティ",
    "question": "通信を規則に従って許可・遮断する仕組みは？",
    "choices": [
      "ファイアウォール",
      "ディスプレイ",
      "データベース表",
      "プリンタ"
    ],
    "answer": 0,
    "explanation": "ファイアウォールは通信の送信元や宛先などに基づいて通信を制御します。"
  },
  {
    "id": "6-10",
    "genre": "セキュリティ",
    "question": "大量の通信などでサービスを利用しにくくする攻撃は？",
    "choices": [
      "DoS攻撃",
      "二分探索",
      "差分バックアップ",
      "データ圧縮"
    ],
    "answer": 0,
    "explanation": "DoS攻撃はサービスの可用性を損なうことを狙う攻撃です。"
  },
  {
    "id": "7-01",
    "genre": "データベース",
    "question": "リレーショナルデータベースでデータを整理する基本構造は？",
    "choices": [
      "表",
      "音声波形",
      "画素",
      "実行ファイル"
    ],
    "answer": 0,
    "explanation": "リレーショナルデータベースは行と列からなる表を基本にデータを管理します。"
  },
  {
    "id": "7-02",
    "genre": "データベース",
    "question": "表の各行を一意に識別するための項目は？",
    "choices": [
      "主キー",
      "外部記憶",
      "拡張子",
      "表示倍率"
    ],
    "answer": 0,
    "explanation": "主キーは行を一意に識別し、重複やNULLを許しません。"
  },
  {
    "id": "7-03",
    "genre": "データベース",
    "question": "別の表のキーを参照し、表どうしを関連付けるものは？",
    "choices": [
      "外部キー",
      "暗号鍵",
      "ファイル名",
      "計算式"
    ],
    "answer": 0,
    "explanation": "外部キーは別の表などのキーを参照し、参照整合性を保つために使います。"
  },
  {
    "id": "7-04",
    "genre": "データベース",
    "question": "SQLでデータを検索する命令は？",
    "choices": [
      "SELECT",
      "INSERT",
      "UPDATE",
      "DELETE"
    ],
    "answer": 0,
    "explanation": "SELECTは表から条件に合うデータを取り出します。"
  },
  {
    "id": "7-05",
    "genre": "データベース",
    "question": "SQLで新しい行を追加する命令は？",
    "choices": [
      "INSERT",
      "SELECT",
      "UPDATE",
      "DELETE"
    ],
    "answer": 0,
    "explanation": "INSERTは表に新しいデータの行を追加します。"
  },
  {
    "id": "7-06",
    "genre": "データベース",
    "question": "SQLで既存のデータを変更する命令は？",
    "choices": [
      "UPDATE",
      "SELECT",
      "INSERT",
      "DROP"
    ],
    "answer": 0,
    "explanation": "UPDATEは既存の行の値を変更します。"
  },
  {
    "id": "7-07",
    "genre": "データベース",
    "question": "SQLで検索する行の条件を指定する句は？",
    "choices": [
      "WHERE",
      "ORDER BY",
      "GROUP BY",
      "FROM"
    ],
    "answer": 0,
    "explanation": "WHEREは検索対象などの行を条件で絞り込むために使います。"
  },
  {
    "id": "7-08",
    "genre": "データベース",
    "question": "一連の処理をすべて実行するか、すべて取り消す性質は？",
    "choices": [
      "原子性",
      "可読性",
      "拡張性",
      "互換性"
    ],
    "answer": 0,
    "explanation": "トランザクションの原子性は、処理の一部だけが反映されることを防ぎます。"
  },
  {
    "id": "7-09",
    "genre": "データベース",
    "question": "トランザクションの変更を確定する操作は？",
    "choices": [
      "COMMIT",
      "ROLLBACK",
      "SELECT",
      "WHERE"
    ],
    "answer": 0,
    "explanation": "COMMITは変更の確定、ROLLBACKは変更の取り消しです。"
  },
  {
    "id": "7-10",
    "genre": "データベース",
    "question": "データの重複や更新時の不整合を減らすために表を整理することは？",
    "choices": [
      "正規化",
      "暗号化",
      "画像補正",
      "負荷試験"
    ],
    "answer": 0,
    "explanation": "正規化はデータの依存関係を整理し、表を適切に分割するなどの設計手法です。"
  }
]
```

## tests/RunTests.gd

```gdscript
extends Node

var failures := 0
var checks := 0
var capture := false

func _ready() -> void:
	if OS.has_feature("web"):
		var start := Button.new()
		start.text = "Start automated QA (test data only)"
		start.position = Vector2(20, 100)
		start.size = Vector2(350, 100)
		add_child(start)
		start.pressed.connect(func():
			MusicManager.unlock()
			start.queue_free()
			_run.call_deferred())
	else:
		_run.call_deferred()

func check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures += 1
		push_error("TEST FAILED: " + message)

func _run() -> void:
	# Keep the runner alive across real scene transitions; isolate persisted data.
	get_tree().current_scene = null
	SaveManager.save_path = "user://qa-test-progress.cfg" if OS.has_feature("web") else "/tmp/itmusic-test-%d.cfg" % OS.get_process_id()
	SaveManager.records = {}
	capture = OS.get_cmdline_user_args().has("--capture")
	_test_data()
	_test_scoring()
	_test_save()
	_test_ring()
	_test_scheduler()
	await _test_board()
	await _test_editor_edits()
	await _test_layouts()
	await _test_flow()
	print("TEST RESULT: %d checks, %d failures" % [checks, failures])
	if OS.has_feature("web"):
		var banner := Label.new()
		banner.text = "QA: %d checks, %d failures" % [checks, failures]
		banner.add_theme_color_override("font_color", Color.BLACK)
		banner.add_theme_font_size_override("font_size", 20)
		var layer := CanvasLayer.new()
		layer.layer = 100
		add_child(layer)
		layer.add_child(banner)
	else:
		get_tree().quit(0 if failures == 0 else 1)

func _test_data() -> void:
	check(GameData.music_catalog.size() == 3, "three demo tracks")
	for song in GameData.music_catalog:
		check(ResourceLoader.exists(song.audio), "audio exists")
		check(ResourceLoader.exists(song.jacket), "jacket exists")
		var audio := load(str(song.audio)) as AudioStream
		check(absf(audio.get_length() - float(song.duration)) < 0.01, "metadata duration matches audio")
		check(song.difficulties.size() == 3, "three difficulties")
	var all_questions := QuizManager.questions()
	check(all_questions.size() == 70, "70 original questions")
	var ids: Array = []
	for question in all_questions:
		check(not ids.has(question.id), "question IDs unique")
		ids.append(question.id)
		check(question.choices.size() == 4 and int(question.answer) in range(4), "four valid answers")
		check(not str(question.explanation).is_empty(), "explanation present")
	for genre in QuizManager.genres() + ["all"]:
		var round_questions := QuizManager.make_round(genre)
		check(round_questions.size() == 10, "ten questions for " + genre)
		var seen: Array = []
		for question in round_questions:
			check(not seen.has(question.id), "no repeated questions per round")
			seen.append(question.id)
			var original: Dictionary = all_questions.filter(func(q: Dictionary): return q.id == question.id)[0]
			check(question.choices[int(question.answer)] == original.choices[int(original.answer)], "answer preserved after shuffle")

func _test_scoring() -> void:
	for pair in [[0.0, "PERFECT"], [0.08, "PERFECT"], [-0.08, "PERFECT"], [0.081, "GOOD"], [0.18, "GOOD"], [-0.18, "GOOD"], [0.181, "MISS"]]:
		check(GameBalance.judge(pair[0]) == pair[1], "timing boundary %s" % pair[0])
	GameData.reset_quiz()
	GameData.quiz_correct = 10
	var first := ScoreManager.apply_hit(1, 0.0)
	check(first.points == 154 and GameData.combo == 1, "first press uses quiz bonus")
	ScoreManager.apply_hit(5, 0.1)
	check(GameData.combo == 2 and GameData.max_combo == 2, "GOOD extends combo")
	ScoreManager.apply_hit(3, 0.25)
	check(GameData.combo == 0 and GameData.max_combo == 2, "MISS resets combo only")
	check(GameData.perfect_count == 1 and GameData.good_count == 1 and GameData.miss_count == 1, "judgment counts")
	GameData.combo = 49
	check(ScoreManager.apply_hit(7, 0.0).milestone, "50 combo milestone")
	check(GameBalance.rank_for(1000, 1000) == "SS" and GameBalance.rank_for(0, 1000) == "C", "rank boundaries")
	GameData.reset_quiz()

func _test_save() -> void:
	SaveManager.record_quiz("test", "normal", 8)
	check(SaveManager.record_score("test", "normal", 1000, 3), "first record")
	check(not SaveManager.record_score("test", "normal", 500, 1), "lower score does not overwrite")
	SaveManager.record_quiz("test", "normal", 3)
	SaveManager.record_score("test", "hard", 2000, 4)
	SaveManager.records = {}
	SaveManager.load_progress()
	var record := SaveManager.record_for("test", "normal")
	check(record.score == 1000 and record.quiz_best == 8 and record.quiz_last == 3, "save roundtrip")
	check(SaveManager.record_for("test", "hard").score == 2000, "difficulty isolation")
	check(SaveManager.last_error.is_empty(), "save succeeded")

func _test_board() -> void:
	var board := PuzzleManager.new()
	board.size = Vector2(346, 420)
	add_child(board)
	await get_tree().process_frame
	check(board.pieces.size() == 48, "board populated")
	for count in [3, 4, 5]:
		board.color_count = count
		for run in 15:
			board.generate()
			var move := board.find_move()
			check(move.size() == 3, "legal move guaranteed")
			_arm(board, move[0])
			board.begin_drag(move[0].position)
			_arm(board, move[1])
			board.move_drag(move[1].position)
			_arm(board, move[0])
			board.move_drag(move[0].position)
			check(board.chain.size() == 1, "backtracking removes last piece")
			_arm(board, move[1])
			board.move_drag(move[1].position)
			_arm(board, move[2])
			board.move_drag(move[2].position)
			check(board.chain.size() >= 3, "drag connects adjacent colors")
			board.end_drag()
			check(board.chain.size() >= 3, "release preserves selected chain")
			board.clear_chain()
			check(board.pieces.size() == 48, "refill preserves count")
			check(not board.find_move().is_empty(), "move after refill")
			for piece in board.pieces:
				check(Rect2(Vector2.ZERO, board.size).has_point(piece.target), "target inside board")
	board.generate()
	var move := board.find_move()
	_arm(board, move[0])
	board.begin_drag(move[0].position)
	board.end_drag()
	check(board.pieces.size() == 48 and not board.dragging, "short chains do not delete")
	_arm(board, move[0])
	board.begin_drag(move[0].position)
	board.cancel_drag()
	check(board.chain.is_empty() and board.active_touch == -1, "cancel clears pointer")
	# Force an otherwise unplayable board and verify deterministic repair.
	for piece in board.pieces:
		piece.color_index = (piece.column + piece.row * 2) % 5
	board.ensure_move()
	check(not board.find_move().is_empty(), "dead board repaired")
	await _test_pointer_events(board)
	_test_press_timing(board)
	board.queue_free()
	await get_tree().process_frame

func _test_pointer_events(board: PuzzleManager) -> void:
	board.generate()
	await get_tree().process_frame
	var move := board.find_move()
	var press := InputEventMouseButton.new()
	press.button_index = MOUSE_BUTTON_LEFT
	press.pressed = true
	press.position = board.get_global_transform_with_canvas() * move[0].position
	_arm(board, move[0])
	_inject_pointer(press)
	await get_tree().process_frame
	for i in [1, 2]:
		var motion := InputEventMouseMotion.new()
		motion.position = board.get_global_transform_with_canvas() * move[i].position
		motion.button_mask = MOUSE_BUTTON_MASK_LEFT
		_arm(board, move[i])
		_inject_pointer(motion)
		await get_tree().process_frame
	check(board.chain.size() >= 3, "mouse events connect chain")
	var release := InputEventMouseButton.new()
	release.button_index = MOUSE_BUTTON_LEFT
	release.position = Vector2(-50, -50)
	_inject_pointer(release)
	await get_tree().process_frame
	check(not board.dragging and board.chain.size() >= 3, "release outside board preserves chain")
	board.generate()
	move = board.find_move()
	var touch := InputEventScreenTouch.new()
	touch.index = 0
	touch.pressed = true
	touch.position = board.get_global_transform_with_canvas() * move[0].position
	_arm(board, move[0])
	_inject_pointer(touch)
	await get_tree().process_frame
	for i in [1, 2]:
		var drag := InputEventScreenDrag.new()
		drag.index = 0
		drag.position = board.get_global_transform_with_canvas() * move[i].position
		_arm(board, move[i])
		_inject_pointer(drag)
		await get_tree().process_frame
	check(board.chain.size() >= 3, "touch events connect chain")
	touch = InputEventScreenTouch.new()
	touch.index = 0
	touch.pressed = false
	touch.canceled = true
	touch.position = Vector2(-50, -50)
	_arm(board, move[0])
	_inject_pointer(touch)
	await get_tree().process_frame
	check(not board.dragging and board.chain.size() >= 3, "touch cancel releases pointer without clearing chain")
	for use_touch in [false, true]:
		board.generate()
		move = board.find_move()
		for piece in move:
			var tap: InputEvent
			if use_touch:
				tap = InputEventScreenTouch.new()
				tap.index = 0
			else:
				tap = InputEventMouseButton.new()
				tap.button_index = MOUSE_BUTTON_LEFT
			tap.pressed = true
			tap.position = board.get_global_transform_with_canvas() * piece.position
			var up: InputEvent = tap.duplicate()
			up.pressed = false
			_arm(board, piece)
			_inject_pointer(tap)
			await get_tree().process_frame
			_inject_pointer(up)
			await get_tree().process_frame
		check(board.chain.size() == 3 and not board.dragging, "separate press/release events retain 3-chain; touch=" + str(use_touch))

func _screen(name: String) -> Node:
	GameData.go(name)
	await get_tree().process_frame
	await get_tree().process_frame
	return get_tree().current_scene

func _test_layouts() -> void:
	for dimensions in [Vector2i(390, 844), Vector2i(360, 640), Vector2i(430, 932), Vector2i(1024, 768)]:
		get_window().size = dimensions
		var game := await _screen("Game")
		await get_tree().process_frame
		check(game.board.size.y >= 320, "board retains usable height")
		check(game.content.get_global_rect().end.x <= game.size.x + 1, "content stays inside width")
		check(game.content.get_global_rect().end.y <= game.size.y + 1, "game stays inside height")
		for piece in game.board.pieces:
			check(piece.target.x - game.board.radius >= 0 and piece.target.x + game.board.radius <= game.board.size.x, "piece radius inside field")
	get_window().size = Vector2i(390, 844)

func _snapshot(name: String) -> void:
	if capture:
		await get_tree().create_timer(0.3).timeout
		await RenderingServer.frame_post_draw
		get_viewport().get_texture().get_image().save_png("res://build/" + name + ".png")

func _test_flow() -> void:
	var screen := await _screen("Title")
	await _snapshot("title")
	check(screen.content.get_child_count() > 0, "title constructed")
	screen._settings()
	check(is_instance_valid(screen.modal_layer), "settings opens")
	_check_modal_fonts(screen.modal_layer)
	await _snapshot("settings")
	screen.close_modal()
	screen._help()
	_check_modal_fonts(screen.modal_layer)
	await _snapshot("help")
	screen.close_modal()
	screen._start()
	await get_tree().process_frame
	await get_tree().process_frame
	screen = get_tree().current_scene
	check(screen.name == "MusicSelect", "start routes to music")
	screen._switch(1)
	check(GameData.selected_music == 1, "music navigation")
	screen._select(2)
	check(GameData.selected_difficulty == 2, "difficulty selection")
	await _snapshot("music")
	screen = await _screen("QuizSelect")
	await _snapshot("genres")
	screen._choose("セキュリティ")
	await get_tree().process_frame
	await get_tree().process_frame
	screen = get_tree().current_scene
	check(screen.name == "Quiz" and screen.questions.size() == 10, "quiz starts")
	await _snapshot("quiz")
	screen.show_pause()
	check(get_tree().paused, "quiz pauses")
	screen.resume_game()
	for i in 10:
		var answer := int(screen.questions[i].answer)
		screen._answer(answer if i < 8 else (answer + 1) % 4)
		screen._answer(answer)
		if i == 0:
			check(GameData.quiz_correct == 1, "double answer ignored")
		screen._next()
	check(GameData.quiz_correct == 8 and GameData.quiz_wrong == 2, "ten question score")
	await get_tree().process_frame
	await get_tree().process_frame
	screen = get_tree().current_scene
	check(screen.name == "Countdown", "countdown follows quiz")
	check(not MusicManager.active, "music does not start during countdown")
	screen.show_pause()
	var count_text: String = screen.count_label.text
	await get_tree().create_timer(1.1).timeout
	check(screen.count_label.text == count_text, "countdown pauses")
	screen.resume_game()
	await get_tree().create_timer(3.6).timeout
	screen = get_tree().current_scene
	check(screen.name == "Game" and MusicManager.active, "game starts with music")
	await get_tree().create_timer(0.3).timeout
	await _snapshot("game")
	var before := MusicManager.song_position()
	screen.show_pause()
	await _snapshot("pause")
	await get_tree().create_timer(0.2).timeout
	check(MusicManager.player.stream_paused and is_equal_approx(before, MusicManager.song_position()), "audio time frozen while paused")
	screen.resume_game()
	var prior_judgments := GameData.perfect_count + GameData.good_count + GameData.miss_count
	var board: PuzzleManager = screen.board
	var move := board.find_move()
	_arm(board, move[0])
	board.begin_drag(move[0].position)
	_arm(board, move[1])
	board.move_drag(move[1].position)
	_arm(board, move[2])
	board.move_drag(move[2].position)
	check(GameData.score > 0, "press produces score before release")
	var score_before_release := GameData.score
	var selected_count := board.chain.size()
	check(GameData.perfect_count + GameData.good_count + GameData.miss_count - prior_judgments == selected_count, "each new piece has its own judgment")
	board.end_drag()
	check(GameData.score == score_before_release and board.chain.size() == selected_count, "release neither judges nor clears")
	board.clear_chain()
	check(GameData.score == score_before_release and board.chain.is_empty(), "clear button removes pieces without another timing judgment")
	# Seek the real player to the end: exercise AudioStreamPlayer.finished routing.
	MusicManager.player.seek(MusicManager.duration() - 0.12)
	await get_tree().create_timer(0.6).timeout
	screen = get_tree().current_scene
	check(screen.name == "Result", "audio completion routes to result")
	await _snapshot("result")
	check(SaveManager.record_for(GameData.music().id, GameData.difficulty().id).get("score", 0) == GameData.score, "result saved")

func _check_modal_fonts(node: Node) -> void:
	if node is Label or node is Button:
		check(node.get_theme_font("font") == UI.FONT, "modal uses bundled Japanese font: " + str(node.name))
		check(node.get_theme_font("font").has_char("設".unicode_at(0)), "modal font contains Japanese glyphs")
	for child in node.get_children():
		_check_modal_fonts(child)

func _test_ring() -> void:
	for bpm in [100.0, 120.0, 140.0]:
		check(is_equal_approx(GameBalance.ring_progress(1.0, bpm), 1.0), "ring reaches edge on beat")
		check(GameBalance.ring_progress(0.4, bpm) < GameBalance.ring_progress(0.7, bpm), "inner ring expands toward beat")
		check(GameBalance.ring_progress(0.5, bpm) < 1.0, "off-beat ring is inside piece")

func _arm(board: PuzzleManager, piece: PuzzlePiece, error := 0.0) -> void:
	board.active_note = piece
	board.note_due_beat = float(board.beat_source.call()) - error * board.scheduler.bpm / 60.0

func _test_scheduler() -> void:
	for cadence in [4.0, 2.0, 1.0]:
		var scheduler := RhythmScheduler.new()
		scheduler.configure(120, cadence)
		var notes: Array = []
		for tick in 9600:
			var due := scheduler.poll(tick / 100.0, true)
			if not is_inf(due): notes.append(due)
		check(notes.size() == int(96 / cadence), "difficulty changes note frequency")
		for i in range(1, notes.size()):
			check(is_equal_approx(notes[i] - notes[i-1], cadence), "notes align to song beats")
		scheduler.configure(120, cadence)
		check(is_inf(scheduler.poll(40.0, true)), "stale notes skipped after frame jump")
		check(is_inf(scheduler.poll(40.0, true)), "no catch-up burst")

func _test_press_timing(board: PuzzleManager) -> void:
	board.generate()
	board.beat_source = func(): return 0.0
	var events: Array = []
	var collect := func(length: int, error: float): events.append([length, GameBalance.judge(error)])
	board.piece_pressed.connect(collect)
	var move := board.find_move()
	board.begin_drag(move[0].position)
	check(events.is_empty() and board.chain.is_empty(), "unmarked pieces ignore presses")
	for i in 3:
		_arm(board, move[i], [0.0, 0.12, -0.25][i])
		board.begin_drag(move[i].position)
		board.end_drag()
	check(events.size() == 3 and events[0][1] == "PERFECT" and events[1][1] == "GOOD" and events[2][1] == "MISS", "each note judges on press")
	check(board.chain.size() == 3, "release preserves chain")
	board.clear_chain()
	check(board.pieces.size() == 48 and board.chain.is_empty(), "clear refills board")
	board.generate()
	board.begin_drag(move[0].position)
	check(events.size() == 3, "consumed note cannot be scored twice")
	var missed: Array = []
	board.note_missed.connect(func(): missed.append(true))
	board.start_rhythm(120, 2)
	board._update_rhythm(0.0)
	check(board.active_note == null, "no rings between scheduled notes")
	board._update_rhythm(2.0 - board.scheduler.lead_beats)
	check(board.active_note != null and board.note_candidates().has(board.active_note), "one random legal target appears")
	board._update_rhythm(2.4)
	board._update_rhythm(2.5)
	check(missed.size() == 1 and board.active_note == null, "missed note expires exactly once")
	var seen: Array = []
	board.rng.seed = 42
	for i in 12:
		board.cancel_drag()
		board.scheduler.next_beat = 4.0 + i * 2
		board._update_rhythm(board.scheduler.next_beat - board.scheduler.lead_beats)
		if not seen.has(board.active_note): seen.append(board.active_note)
	check(seen.size() > 1, "targets vary across scheduled notes")
	board.cancel_drag()
	board.rhythm_enabled = false
	board.piece_pressed.disconnect(collect)
	board.beat_source = func(): return MusicManager.beat_position()

func _inject_pointer(event: InputEvent) -> void:
	# parse_input_event takes window pixels, not stretched canvas coordinates.
	# Headless defaults to a 64x64 window, so a direct position only worked at 1x.
	event.position = get_viewport().get_final_transform() * event.position
	Input.parse_input_event(event)

func _test_editor_edits() -> void:
	var editable := load("res://scenes/Title.tscn").instantiate() as Control
	var title := editable.find_child("TitleText", true, false) as Label
	title.text = "エディタから変更"
	title.add_theme_font_size_override("font_size", 42)
	editable.find_child("StartButton", true, false).text = "遊び始める"
	editable.find_child("SafeArea", true, false).add_theme_constant_override("margin_left", 31)
	editable.find_child("VolumeLabel", true, false).text = "音の大きさ {volume}%"
	var added := Label.new()
	added.name = "AuthorAddedLabel"
	added.text = "追加した説明"
	editable.find_child("Content", true, false).add_child(added)
	added.owner = editable
	var packed := PackedScene.new()
	check(packed.pack(editable) == OK, "editor changes serialize")
	editable.free()
	var screen := packed.instantiate() as ScreenBase
	add_child(screen)
	await get_tree().process_frame
	check(screen.ui("TitleText").text == "エディタから変更", "saved Label.Text survives runtime ready")
	check(screen.ui("TitleText").get_theme_font_size("font_size") == 42, "saved font style survives runtime ready")
	check(screen.ui("StartButton").text == "遊び始める", "saved button text survives runtime ready")
	check(screen.safe_margin.get_theme_constant("margin_left") == 31, "editor spacing survives safe area setup")
	check(screen.ui("AuthorAddedLabel") != null, "author-added UI is retained")
	check(not screen.has_node("EditorPreview"), "there is no disposable preview tree")
	var help: Node = screen.ui("HelpDialog")
	screen._help()
	screen.close_modal()
	screen._help()
	check(screen.modal_layer == help, "dialog is the saved scene node, not regenerated")
	screen._settings()
	check(screen.ui("VolumeLabel").text.begins_with("音の大きさ "), "editor dynamic text template retained")
	screen.close_modal()
	screen.free()
	GameData.selected_music = 0
	GameData.selected_difficulty = 0
	var music := load("res://scenes/MusicSelect.tscn").instantiate() as ScreenBase
	music.ui("RecordScore").text = "最高記録 {score}"
	var song_node: Node = music.ui("SongTitle")
	add_child(music)
	music._switch(1)
	check(music.ui("SongTitle") == song_node and song_node.text == GameData.music().title, "song changes update existing node")
	check(music.ui("RecordScore").text == "最高記録 000000", "custom format survives song change")
	music.free()
	var quiz := load("res://scenes/Quiz.tscn").instantiate() as ScreenBase
	quiz.ui("QuestionCount").text = "問題 {number}"
	var question_node: Node = quiz.ui("QuestionText")
	add_child(quiz)
	quiz._answer(int(quiz.questions[0].answer))
	quiz._next()
	check(quiz.ui("QuestionText") == question_node, "next question keeps authored UI")
	check(quiz.ui("QuestionCount").text == "問題 2", "custom format survives question change")
	quiz.free()
	GameData.selected_music = 0
	GameData.selected_difficulty = 0
	GameData.reset_quiz()
```

## tests/RunTests.tscn

```ini
[gd_scene load_steps=2 format=3]

[ext_resource type="Script" path="res://tests/RunTests.gd" id="1"]

[node name="RunTests" type="Node"]
process_mode = 3
script = ExtResource("1")
```
