class_name Reinforcements
extends RefCounted


var _nation_to_pieces: Dictionary[Enums.Nation, Array] = {}


func _init() -> void:
	for nation: Enums.Nation in Enums.Nation.values():
		_nation_to_pieces[nation] = []


func get_reinforcements_by_nation(nation: Enums.Nation) -> Array[Piece]:
	return _nation_to_pieces[nation]


func add(piece: Piece) -> void:
	_nation_to_pieces[piece.get_nation()].append(piece)


func add_all(pieces: Array[Piece]) -> void:
	for piece: Piece in pieces:
		add(piece)


func remove(piece: Piece) -> void:
	assert(_nation_to_pieces[piece.get_nation()].has(piece))
	_nation_to_pieces[piece.get_nation()].erase(piece)
