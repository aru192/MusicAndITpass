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
