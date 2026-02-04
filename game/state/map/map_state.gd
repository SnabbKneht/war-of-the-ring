class_name MapState
extends RefCounted


var _region_states: Dictionary[int, RegionState] = {}


func get_region_state_by_id(id: int) -> RegionState:
	assert(_region_states.keys().has(id))
	return _region_states[id]


func add_piece_to_region(id: int, piece: Piece) -> void:
	get_region_state_by_id(id).add_piece(piece)


func add_pieces_to_region(id: int, pieces: Array[Piece]) -> void:
	get_region_state_by_id(id).add_pieces(pieces)


func remove_piece_from_region(id: int, piece: Piece) -> void:
	get_region_state_by_id(id).remove_piece(piece)


func remove_pieces_from_region(id: int, pieces: Array[Piece]) -> void:
	get_region_state_by_id(id).remove_pieces(pieces)
