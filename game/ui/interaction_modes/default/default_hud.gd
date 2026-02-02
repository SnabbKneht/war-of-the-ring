class_name DefaultHUD
extends CanvasLayer


signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)
signal neighbor_highlight_requested(region_id: int)
signal neighbor_highlight_cancelled(region_id: int)
signal army_movement_mode_requested(piece_ids: Array[StringName])


@onready var _political_track_view: PoliticalTrackView = $PoliticalTrackView
@onready var _region_details_view: RegionDetailsView = $RegionDetailsView


var _game_state: GameState


func _ready() -> void:
	_political_track_view.advance_nation_requested.connect(advance_nation_requested.emit)
	_political_track_view.move_back_nation_requested.connect(move_back_nation_requested.emit)
	_region_details_view.neighbor_highlight_requested.connect(neighbor_highlight_requested.emit)
	_region_details_view.neighbor_highlight_cancelled.connect(neighbor_highlight_cancelled.emit)
	_region_details_view.army_movement_mode_requested.connect(army_movement_mode_requested.emit)


func set_game_state(p_game_state: GameState) -> void:
	_game_state = p_game_state
	_political_track_view.set_game_state(_game_state)
	_political_track_view.set_political_state(_game_state.political_state)


func show_region_details(region_state: RegionState) -> void:
	_region_details_view.set_region_state(region_state)
	_region_details_view.show()


func hide_region_details() -> void:
	_region_details_view.hide()
