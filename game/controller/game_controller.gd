class_name GameController
extends Node


@onready var game_ui: GameUI = $GameUI
var game_state: GameState


func _ready() -> void:
	game_state = GameStateFactory.create()
	game_ui.set_game_state(game_state)
	
	game_ui.region_selected.connect(_on_region_selected)
	game_ui.region_deselected.connect(_on_region_deselected)
	game_ui.region_hovered.connect(_on_region_hovered)
	game_ui.neighbor_icon_mouse_entered.connect(_on_neighbor_icon_mouse_entered)
	game_ui.neighbor_icon_mouse_exited.connect(_on_neighbor_icon_mouse_exited)
	game_ui.advance_nation_requested.connect(_on_advance_nation_requested)
	game_ui.move_back_nation_requested.connect(_on_move_back_nation_requested)


func _on_region_selected(region_id: int) -> void:
	game_ui.show_region_details(game_state.map_state.get_region_state_by_id(region_id))
	game_ui.clear_region_overlay(UIEnums.RegionOverlay.SELECTION)
	game_ui.add_region_overlay([region_id], UIEnums.RegionOverlay.SELECTION)


func _on_region_deselected() -> void:
	game_ui.hide_region_details()
	game_ui.clear_region_overlay(UIEnums.RegionOverlay.SELECTION)


func _on_region_hovered(region_id: int) -> void:
	game_ui.clear_region_overlay(UIEnums.RegionOverlay.HIGHLIGHT)
	game_ui.add_region_overlay([region_id], UIEnums.RegionOverlay.HIGHLIGHT)


func _on_neighbor_icon_mouse_entered(region_id: int) -> void:
	game_ui.clear_region_overlay(UIEnums.RegionOverlay.NEIGHBOR)
	game_ui.add_region_overlay(GameData.get_neighbors(region_id), UIEnums.RegionOverlay.NEIGHBOR)


func _on_neighbor_icon_mouse_exited(_region_id: int) -> void:
	game_ui.clear_region_overlay(UIEnums.RegionOverlay.NEIGHBOR)


func _on_advance_nation_requested(nation: Enums.Nation) -> void:
	var action: GameAction = PoliticalLogic.create_advance_nation_action(nation)
	if action.can_apply(game_state):
		action.apply(game_state)
		# Add action to history


func _on_move_back_nation_requested(nation: Enums.Nation) -> void:
	var action: GameAction = PoliticalLogic.create_move_back_nation_action(nation)
	if action.can_apply(game_state):
		action.apply(game_state)
		# Add action to history
