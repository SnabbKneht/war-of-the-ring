class_name GameUI
extends Node


@onready var map_view: MapView = $MapView


func set_game_state(game_state: GameState) -> void:
	map_view.set_map_state(game_state.map_state)
