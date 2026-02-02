@abstract
class_name InteractionMode
extends Node


var _game_state: GameState
var _game_ui: GameUI


func _init(p_game_state: GameState, p_game_ui: GameUI) -> void:
	_game_state = p_game_state
	_game_ui = p_game_ui


@abstract func on_cancel() -> void
