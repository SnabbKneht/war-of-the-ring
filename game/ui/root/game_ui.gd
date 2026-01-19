class_name GameUI
extends Node


signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var map_view: MapView = $MapView
@onready var political_track_view: PoliticalTrackView = $HUD/PoliticalTrackView


func _ready() -> void:
	political_track_view.advance_nation_requested.connect(_on_advance_nation_requested)
	political_track_view.move_back_nation_requested.connect(_on_move_back_nation_requested)


func set_game_state(game_state: GameState) -> void:
	map_view.set_map_state(game_state.map_state)
	political_track_view.set_political_state(game_state.political_state)


func _on_advance_nation_requested(nation: Enums.Nation) -> void:
	advance_nation_requested.emit(nation)


func _on_move_back_nation_requested(nation: Enums.Nation) -> void:
	move_back_nation_requested.emit(nation)
