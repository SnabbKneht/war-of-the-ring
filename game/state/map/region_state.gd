class_name RegionState
extends RefCounted


func _init(region_data: RegionData) -> void:
	self.region_data = region_data
	controlled_by = region_data.side
	is_conquered = false


var region_data: RegionData
var _pieces: Array[Piece] = []
var controlled_by: Enums.Side
var is_conquered: bool


func add_pieces(pieces: Array[Piece]) -> void:
	_pieces.append_array(pieces)


func remove_pieces(pieces: Array[Piece]) -> void:
	for p: Piece in pieces:
		_pieces.erase(p)
