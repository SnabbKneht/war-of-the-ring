class_name MoveArmyAction
extends GameAction


var _piece_ids: Array[StringName]
var _from_region_id: int
var _to_region_id: int


func _init(p_piece_ids: Array[StringName], p_from_region_id: int, p_to_region_id: int) -> void:
	_piece_ids = p_piece_ids
	_from_region_id = p_from_region_id
	_to_region_id = p_to_region_id


func can_apply(game_state: GameState) -> bool:
	return true


func apply(game_state: GameState) -> void:
	pass


func undo(game_state: GameState) -> void:
	pass
