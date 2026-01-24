class_name PiecePool
extends RefCounted


var _pieces: Dictionary[StringName, Piece] = {}


func get_piece(id: StringName) -> Piece:
	assert(id in _pieces.keys())
	return _pieces[id]


func get_all_pieces() -> Array[Piece]:
	return _pieces.values()
