class_name RegionState
extends RefCounted


signal changed


func _init(region_data: RegionData) -> void:
	self.region_data = region_data
	controlled_by = region_data.side
	is_conquered = false


var region_data: RegionData
var _pieces: Array[Piece] = []
var controlled_by: Enums.Side
var is_conquered: bool


func add_piece(piece: Piece) -> void:
	_pieces.append(piece)
	changed.emit()


func add_pieces(pieces: Array[Piece]) -> void:
	_pieces.append_array(pieces)
	changed.emit()


func remove_pieces(pieces: Array[Piece]) -> void:
	for p: Piece in pieces:
		assert(_pieces.has(p))
		_pieces.erase(p)
	changed.emit()


func get_pieces() -> Array[Piece]:
	return _pieces


func get_total_combat_value() -> int:
	var result: int = 0
	for piece: Piece in _pieces:
		result += piece.combat_value
	return result


func get_total_leadership_value() -> int:
	var result: int = 0
	for piece: Piece in _pieces:
		result += piece.leadership_value
	return result


func _to_string() -> String:
	var info: String = region_data.name + ": " + str(_pieces)
	return info
