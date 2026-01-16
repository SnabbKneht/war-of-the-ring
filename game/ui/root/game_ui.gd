class_name GameUI
extends Node


@onready var map_view: MapView = $MapView
@onready var political_track_view: PoliticalTrackView = $HUD/PoliticalTrackView


func set_game_state(game_state: GameState) -> void:
	map_view.set_map_state(game_state.map_state)
	political_track_view.set_political_state(game_state.political_state)
