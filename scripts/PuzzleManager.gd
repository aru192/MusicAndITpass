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
var secondary_note: PuzzlePiece
var note_kind := "tap"
var hold_end := 0.0
var hold_error := 0.0
var pressed_notes: Dictionary = {}
var pointer_notes: Dictionary = {}
var holding := false
var active_note: PuzzlePiece
var note_due_beat := 0.0
var rhythm_enabled := false
var beat_source: Callable = func() -> float: return MusicManager.beat_position()

func start_rhythm(bpm: float, cadence_beats: float) -> void:
	scheduler.configure(bpm, cadence_beats)
	active_note = null
	rhythm_enabled = true

func start_chart(times: Array) -> void:
	scheduler.configure_chart(times, float(SaveManager.settings.approach_seconds), GameData.selected_difficulty)
	beat_source = func(): return MusicManager.chart_position()
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
		if piece == active_note or piece == secondary_note:
			var target_radius := radius - 3.0
			var ring := GameBalance.note_ring_progress(beat, note_due_beat, scheduler.lead_beats)
			if holding: ring = clampf((hold_end - beat) / maxf(hold_end - note_due_beat, 0.01), 0.0, 1.0)
			draw_arc(piece.position, target_radius, 0, TAU, 32, Color.WHITE, 2, true)
			var ring_color := Color.WHITE if absf((beat - note_due_beat) * 60.0 / scheduler.bpm) <= GameBalance.PERFECT_WINDOW else UI.INK
			draw_arc(piece.position, target_radius * ring, 0, TAU, 32, ring_color, 2.2, true)
			draw_arc(piece.position, radius + 2, 0, TAU, 32, UI.PURPLE, 3, true)
			if note_kind != "tap":
				draw_string(UI.FONT, piece.position + Vector2(-14, 5), "長" if note_kind == "hold" else "同", HORIZONTAL_ALIGNMENT_CENTER, 28, 18, UI.INK)
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
	if scheduler.chart_mode and note_kind != "tap":
		if event is InputEventScreenTouch and event.pressed:
			_special_press(event.index, event.position)
			accept_event()
		elif event is InputEventMouseButton and event.pressed and event.device != InputEvent.DEVICE_ID_EMULATION and event.button_index in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT]:
			_special_press(-int(event.button_index), event.position)
			accept_event()
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
	if not pointer_notes.is_empty():
		if event is InputEventScreenTouch and not event.pressed: _special_release(event.index)
		elif event is InputEventMouseButton and not event.pressed and event.device != InputEvent.DEVICE_ID_EMULATION: _special_release(-int(event.button_index))
		elif event is InputEventScreenDrag:
			_check_hold_position(event.index, get_global_transform_with_canvas().affine_inverse() * event.position)
		elif event is InputEventMouseMotion and holding:
			_check_hold_position(-1, get_global_transform_with_canvas().affine_inverse() * event.position)
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
	if scheduler.chart_mode and note_kind != "tap": return
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
	_reset_special()
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
	if holding or secondary_note != null: return
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
	if holding:
		if beat >= hold_end:
			_complete_special(hold_error)
		return
	if active_note and (beat - note_due_beat) * 60.0 / scheduler.bpm > GameBalance.GOOD_WINDOW:
		active_note = null
		_reset_special()
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
	if scheduler.chart_mode:
		note_kind = str(scheduler.current_event.get("kind", "tap"))
		hold_end = float(scheduler.current_event.get("end", due))
		if note_kind == "double":
			# The pair forms a legal consecutive extension in either press order.
			for first in candidates:
				for second in pieces:
					if second != first and not chain.has(second) and second.color_index == first.color_index and adjacent(first, second):
						var blocked: Array[PuzzlePiece] = chain.duplicate()
						blocked.append(first)
						blocked.append(second)
						if not _has_tail(second, blocked, maxi(0, GameBalance.MIN_CHAIN - blocked.size())): continue
						active_note = first
						secondary_note = second
						break
				if secondary_note != null: break
			if secondary_note == null: note_kind = "tap"
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

func _reset_special() -> void:
	secondary_note = null
	pressed_notes.clear()
	pointer_notes.clear()
	holding = false
	note_kind = "tap"

func _special_press(id: int, point: Vector2) -> void:
	if active_note == null or pointer_notes.has(id): return
	var piece := piece_at(point)
	if piece != active_note and piece != secondary_note: return
	if piece == null or pressed_notes.has(piece): return
	var error := float(beat_source.call()) - note_due_beat
	if error < -GameBalance.GOOD_WINDOW: return
	if error > GameBalance.GOOD_WINDOW: return
	pointer_notes[id] = piece
	pressed_notes[piece] = error
	if note_kind == "hold":
		holding = true
		hold_error = error
	elif pressed_notes.size() == 2:
		var first := float(pressed_notes[active_note])
		var second := float(pressed_notes[secondary_note])
		if absf(first - second) <= 0.08:
			_complete_special(first if absf(first) > absf(second) else second)
		else:
			active_note = null
			_reset_special()
			note_missed.emit()

func _special_release(id: int) -> void:
	if not pointer_notes.has(id): return
	if holding:
		if float(beat_source.call()) >= hold_end:
			_complete_special(hold_error)
		else:
			active_note = null
			_reset_special()
			note_missed.emit()
	else:
		pressed_notes.erase(pointer_notes[id])
		pointer_notes.erase(id)

func _check_hold_position(id: int, point: Vector2) -> void:
	if holding and pointer_notes.has(id) and point.distance_to(active_note.position) > radius * 1.5:
		_special_release(id)

func _complete_special(error: float) -> void:
	var targets: Array = [active_note]
	if secondary_note != null: targets.append(secondary_note)
	for piece in targets:
		chain.append(piece)
		piece_pressed.emit(chain.size(), error)
	active_note = null
	_reset_special()
	_update_line()
	chain_changed.emit(chain.size())
	queue_redraw()

func suspend_input() -> void:
	# Pause interrupts a held gesture without granting a score or a miss.
	if holding or not pointer_notes.is_empty():
		active_note = null
		_reset_special()
	end_drag()
