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
var roles: Array[Role] = []
var combat_value: int
var leadership_value: int
var can_receive_damage: bool
var can_be_reduced_to_regular: bool
var must_be_in_army: bool
var can_move_army: bool
var counts_to_unit_cap: bool


func _init(p_id: int, p_piece_type: PieceType) -> void:
	id = p_id
	piece_type = p_piece_type
	_init_roles()
	_init_combat_value()
	_init_leadership_value()
	_init_can_receive_damage()
	_init_can_be_reduced_to_regular()
	_init_must_be_in_army()
	_init_can_move_army()
	_init_counts_to_unit_cap()


func _init_roles() -> void:
	match piece_type.category:
		PieceType.Category.REGULAR:
			roles.append_array([Role.UNIT, Role.REGULAR])
		PieceType.Category.ELITE:
			roles.append_array([Role.UNIT, Role.ELITE])
		PieceType.Category.FREE_PEOPLES_LEADER:
			roles.append(Role.LEADER)
		PieceType.Category.NAZGUL:
			roles.append_array([Role.LEADER, Role.NAZGUL])
		PieceType.Category.COMPANION:
			roles.append_array([Role.CHARACTER, Role.COMPANION])
		PieceType.Category.MINION:
			roles.append_array([Role.CHARACTER, Role.MINION])


func _init_combat_value() -> void:
	if Role.UNIT in roles:
		combat_value = 1
	else:
		combat_value = 0


func _init_leadership_value() -> void:
	if Role.LEADER in roles or Role.NAZGUL in roles:
		leadership_value = 1
	else:
		leadership_value = 0


func _init_can_receive_damage() -> void:
	can_receive_damage = Role.UNIT in roles


func _init_can_be_reduced_to_regular() -> void:
	can_be_reduced_to_regular = Role.ELITE in roles


func _init_must_be_in_army() -> void:
	must_be_in_army = Role.UNIT in roles or piece_type.category == PieceType.Category.FREE_PEOPLES_LEADER


func _init_can_move_army() -> void:
	can_move_army = Role.LEADER in roles or Role.CHARACTER in roles


func _init_counts_to_unit_cap() -> void:
	counts_to_unit_cap = Role.UNIT in roles


func _to_string() -> String:
	return "Piece #" + str(id) + " (" + piece_type.id + ")"
