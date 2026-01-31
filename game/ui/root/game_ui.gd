class_name GameUI
extends Node


signal region_selected(region_id: int)
signal region_deselected
signal region_hovered(region_id: int)
signal neighbor_highlight_requested(region_id: int)
signal neighbor_highlight_cancelled(region_id: int)
signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var map_view: MapView = $MapView
@onready var political_track_view: PoliticalTrackView = $HUD/PoliticalTrackView
@onready var region_details_view: RegionDetailsView = $HUD/RegionDetailsView


var _game_state: GameState


func _ready() -> void:
	map_view.region_selected.connect(region_selected.emit)
	map_view.region_deselected.connect(region_deselected.emit)
	map_view.region_hovered.connect(region_hovered.emit)
	region_details_view.neighbor_highlight_requested.connect(neighbor_highlight_requested.emit)
	region_details_view.neighbor_highlight_cancelled.connect(neighbor_highlight_cancelled.emit)
	political_track_view.advance_nation_requested.connect(advance_nation_requested.emit)
	political_track_view.move_back_nation_requested.connect(move_back_nation_requested.emit)


func set_game_state(game_state: GameState) -> void:
	_game_state = game_state
	map_view.set_map_state(game_state.map_state)
	political_track_view.set_game_state(game_state)
	political_track_view.set_political_state(game_state.political_state)


func show_region_details(region_state: RegionState) -> void:
	region_details_view.set_region_state(region_state)
	region_details_view.show()


func hide_region_details() -> void:
	region_details_view.hide()


func add_region_overlay(region_ids: Array[int], overlay: UIEnums.RegionOverlay) -> void:
	map_view.add_region_overlay(region_ids, overlay)


func remove_region_overlay(region_ids: Array[int], overlay: UIEnums.RegionOverlay) -> void:
	map_view.remove_region_overlay(region_ids, overlay)


func clear_region_overlay(overlay: UIEnums.RegionOverlay) -> void:
	map_view.clear_region_overlay(overlay)
