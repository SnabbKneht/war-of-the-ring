class_name PiecePool
extends RefCounted


var _pieces: Dictionary[StringName, Piece] = {}


func get_all_pieces() -> Array[Piece]:
	return _pieces.values()
