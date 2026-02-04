class_name PiecePool
extends RefCounted


var _pieces: Dictionary[StringName, Piece] = {}


func get_piece(piece_id: StringName) -> Piece:
	assert(piece_id in _pieces.keys())
	return _pieces[piece_id]


func get_pieces(piece_ids: Array[StringName]) -> Array[Piece]:
	assert(_pieces.has_all(piece_ids))
	var pieces: Array[Piece] = []
	for id: StringName in piece_ids:
		pieces.append(_pieces[id])
	return pieces


func get_all_pieces() -> Array[Piece]:
	return _pieces.values()
