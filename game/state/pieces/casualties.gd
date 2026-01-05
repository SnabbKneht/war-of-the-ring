class_name Casualties
extends RefCounted


var _pieces: Array[Piece] = []


func add(piece: Piece) -> void:
	_pieces.append(piece)


func remove(piece: Piece) -> void:
	_pieces.erase(piece)
