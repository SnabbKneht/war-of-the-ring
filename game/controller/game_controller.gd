class_name GameController
extends Node


@onready var map_root: MapRoot = $MapRoot
var game_state: GameState


func _ready() -> void:
	game_state = GameStateFactory.create()
	map_root.game_state = game_state


func _process(delta: float) -> void:
	pass
