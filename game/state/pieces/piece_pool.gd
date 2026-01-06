class_name PiecePool
extends RefCounted


var _pieces: Dictionary[int, Piece] = {}
var _next_id: int = 1


func get_all_pieces() -> Array[Piece]:
	return _pieces.values()


func create_new_piece(piece_type: PieceType) -> Piece:
	var new_piece: Piece = Piece.new(_next_id, piece_type)
	_pieces[_next_id] = new_piece
	_next_id += 1
	return new_piece
