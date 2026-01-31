class_name GameUI
extends Node


signal region_selected(region_id: int)
signal region_deselected
signal region_hovered(region_id: int)


@onready var map_view: MapView = $MapView


var _game_state: GameState


func _ready() -> void:
	map_view.region_selected.connect(region_selected.emit)
	map_view.region_deselected.connect(region_deselected.emit)
	map_view.region_hovered.connect(region_hovered.emit)


func set_game_state(game_state: GameState) -> void:
	_game_state = game_state
	map_view.set_map_state(game_state.map_state)


func add_region_overlay(region_ids: Array[int], overlay: UIEnums.RegionOverlay) -> void:
	map_view.add_region_overlay(region_ids, overlay)


func remove_region_overlay(region_ids: Array[int], overlay: UIEnums.RegionOverlay) -> void:
	map_view.remove_region_overlay(region_ids, overlay)


func clear_region_overlay(overlay: UIEnums.RegionOverlay) -> void:
	map_view.clear_region_overlay(overlay)
