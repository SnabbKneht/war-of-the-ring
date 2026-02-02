class_name ArmyMovementMode
extends InteractionMode


signal army_movement_requested(piece_ids: Array[StringName], from_region_id: int, to_region_id: int)


var _game_state: GameState
var _game_ui: GameUI
var _piece_ids: Array[StringName] = []
var _from_region_id: int


func _ready() -> void:
	var accessible_regions: Array[int] = MovementLogic.get_valid_move_targets(_game_state, _piece_ids, _from_region_id)
	_game_ui.add_region_overlay(accessible_regions, UIEnums.RegionOverlay.ACCESSIBLE)


func configure(p_game_state: GameState, p_game_ui: GameUI, p_piece_ids: Array[StringName], p_from_region_id) -> void:
	_game_state = p_game_state
	_game_ui = p_game_ui
	_piece_ids = p_piece_ids
	_from_region_id = p_from_region_id


func on_cancel() -> void:
	pass
