class_name ArmyMovementMode
extends InteractionMode


signal army_movement_requested(piece_ids: Array[StringName], from_region_id: int, to_region_id: int)


var _game_state: GameState
var _game_ui: GameUI
var _piece_ids: Array[StringName] = []
var _from_region_id: int
var _accessible_regions: Array[int] = []


func _ready() -> void:
	_accessible_regions = MovementLogic.get_valid_move_targets(_game_state, _piece_ids, _from_region_id)
	_game_ui.region_hovered.connect(_on_region_hovered)
	_game_ui.region_selected.connect(_on_region_selected)
	_game_ui.add_region_overlay([_from_region_id], UIEnums.RegionOverlay.SELECTION)
	_game_ui.add_region_overlay(_accessible_regions, UIEnums.RegionOverlay.ACCESSIBLE)


func configure(p_game_state: GameState, p_game_ui: GameUI, p_piece_ids: Array[StringName], p_from_region_id: int) -> void:
	_game_state = p_game_state
	_game_ui = p_game_ui
	_piece_ids = p_piece_ids
	_from_region_id = p_from_region_id


func exit() -> void:
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.SELECTION)
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.ACCESSIBLE)


func on_cancel() -> void:
	pass


func _on_region_hovered(region_id: int) -> void:
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.HIGHLIGHT)
	if region_id in _accessible_regions:
		_game_ui.add_region_overlay([region_id], UIEnums.RegionOverlay.HIGHLIGHT)


func _on_region_selected(region_id: int) -> void:
	if region_id in _accessible_regions:
		army_movement_requested.emit(_piece_ids, _from_region_id, region_id)
