class_name ArmyMovementMode
extends InteractionMode


signal army_movement_requested(piece_ids: Array[StringName], from_region_id: int, to_region_id: int)


var _piece_ids: Array[StringName] = []


func _init(p_game_state: GameState, p_game_ui: GameUI, p_piece_ids: Array[StringName]) -> void:
	_game_state = p_game_state
	_game_ui = p_game_ui
	_piece_ids = p_piece_ids


func exit() -> void:
	pass


func on_cancel() -> void:
	pass


func set_piece_ids(p_piece_ids) -> void:
	_piece_ids = p_piece_ids
