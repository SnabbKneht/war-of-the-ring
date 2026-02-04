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
	return MovementLogic.can_move_army(game_state, _piece_ids, _to_region_id)


func apply(game_state: GameState) -> void:
	assert(can_apply(game_state))
	var pieces_to_move: Array[Piece] = game_state.piece_pool.get_pieces(_piece_ids)
	game_state.map_state.remove_pieces_from_region(_from_region_id, pieces_to_move)
	game_state.map_state.add_pieces_to_region(_to_region_id, pieces_to_move)


func undo(game_state: GameState) -> void:
	var pieces_to_move: Array[Piece] = game_state.piece_pool.get_pieces(_piece_ids)
	game_state.map_state.remove_pieces_from_region(_to_region_id, pieces_to_move)
	game_state.map_state.add_pieces_to_region(_from_region_id, pieces_to_move)
