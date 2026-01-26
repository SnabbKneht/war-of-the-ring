class_name Piece
extends RefCounted


var _id: StringName
var _piece_type: PieceType


func get_id() -> StringName:
	return _id


func get_piece_type_id() -> StringName:
	return _piece_type.id


func get_piece_type() -> PieceType:
	return _piece_type


func get_side() -> Enums.Side:
	return _piece_type.side


func get_nation() -> Enums.Nation:
	return _piece_type.nation


func is_army_unit() -> bool:
	return _piece_type.category in [
		PieceType.Category.REGULAR,
		PieceType.Category.ELITE,
		PieceType.Category.FREE_PEOPLES_LEADER
	]


func _init(p_id: StringName, p_piece_type: PieceType) -> void:
	_id = p_id
	_piece_type = p_piece_type
