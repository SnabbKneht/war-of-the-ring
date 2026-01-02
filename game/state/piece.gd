class_name Piece
extends RefCounted


enum Role {
	UNIT,
	REGULAR,
	ELITE,
	LEADER,
	NAZGUL,
	CHARACTER,
	COMPANION,
	MINION
}


var id: int
var piece_type: PieceType
var roles: Array[Role]
var combat_value: int
var leadership_value: int
var can_receive_damage: bool
var can_be_reduced_to_regular: bool
var must_be_in_army: bool
var can_move_army: bool
var counts_to_unit_cap: bool
