class_name MapState
extends RefCounted


var _region_states: Dictionary[int, RegionState] = {}


func get_region_state_by_id(id: int) -> RegionState:
	assert(_region_states.keys().has(id))
	return _region_states[id]


func add_pieces_to_region(id: int, pieces: Array[Piece]) -> void:
	get_region_state_by_id(id).add_pieces(pieces)
