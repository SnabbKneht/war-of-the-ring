class_name PieceType
extends Resource

@export var id: String
@export var side: Enums.Player
@export var nation: Enums.Nation
@export var combat_value: int
@export var leadership_value: int
@export var can_receive_damage: bool
@export var can_be_reduced_to_regular: bool
@export var must_be_in_army: bool
@export var can_move_army: bool
