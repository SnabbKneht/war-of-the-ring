class_name PieceType
extends Resource


enum Category {
	REGULAR,
	ELITE,
	FREE_PEOPLES_LEADER,
	NAZGUL,
	COMPANION,
	MINION
}


@export var id: String
@export var side: Enums.Side
@export var nation: Enums.Nation
@export var category: Category
