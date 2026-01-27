class_name GameUI
extends Node


signal region_selected(region_id: int)
signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var map_view: MapView = $MapView
@onready var political_track_view: PoliticalTrackView = $HUD/PoliticalTrackView
@onready var region_details_view: RegionDetailsView = $HUD/RegionDetailsView


var _game_state: GameState


func _ready() -> void:
	map_view.region_selected.connect(_on_region_selected)
	political_track_view.advance_nation_requested.connect(_on_advance_nation_requested)
	political_track_view.move_back_nation_requested.connect(_on_move_back_nation_requested)


func set_game_state(game_state: GameState) -> void:
	_game_state = game_state
	map_view.set_map_state(game_state.map_state)
	political_track_view.set_game_state(game_state)
	political_track_view.set_political_state(game_state.political_state)


func show_region_details(region_state: RegionState) -> void:
	region_details_view.set_region_state(region_state)
	region_details_view.show()


func highlight_regions(region_ids: Array[int]) -> void:
	map_view.highlight_regions(region_ids)


func _on_region_selected(region_id: int) -> void:
	region_selected.emit(region_id)


func _on_advance_nation_requested(nation: Enums.Nation) -> void:
	advance_nation_requested.emit(nation)


func _on_move_back_nation_requested(nation: Enums.Nation) -> void:
	move_back_nation_requested.emit(nation)
