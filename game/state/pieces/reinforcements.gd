class_name Reinforcements
extends RefCounted


var _free_peoples: Array[Piece] = []
var _shadow: Array[Piece] = []


func add(piece: Piece) -> void:
	match piece.piece_type.side:
		Enums.Side.FREE_PEOPLES:
			_free_peoples.append(piece)
		Enums.Side.SHADOW:
			_shadow.append(piece)


func add_all(pieces: Array[Piece]) -> void:
	for piece: Piece in pieces:
		add(piece)


func remove(piece: Piece) -> void:
	if piece in _free_peoples:
		_free_peoples.erase(piece)
	elif piece in _shadow:
		_shadow.erase(piece)
