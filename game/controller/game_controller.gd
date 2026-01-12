class_name GameController
extends Node


@onready var game_ui: GameUI = $GameUI
var game_state: GameState


func _ready() -> void:
	game_state = GameStateFactory.create()
	game_ui.set_game_state(game_state)
