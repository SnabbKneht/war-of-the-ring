class_name MovementLogic
extends RefCounted


static func can_move_army(game_state: GameState, piece_ids: Array[StringName], from_region: int, to_region: int) -> bool:
	return true


static func _can_piece_enter_nation(game_state: GameState, piece_id: StringName, nation: Enums.Nation) -> bool:
	if nation == Enums.Nation.NONE:
		return true
	var piece: Piece = game_state.piece_pool.get_piece(piece_id)
	if not piece.is_army_unit():
		return true
	elif piece.get_nation() == nation:
		return true
	else:
		return game_state.political_state.is_nation_at_war(piece.get_nation())


static func _can_all_pieces_enter_nation(game_state: GameState, piece_ids: Array[StringName], nation: Enums.Nation) -> bool:
	for piece_id: StringName in piece_ids:
		if not _can_piece_enter_nation(game_state, piece_id, nation):
			return false
	return true
