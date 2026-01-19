class_name GameController
extends Node


@onready var game_ui: GameUI = $GameUI
var game_state: GameState


func _ready() -> void:
	game_state = GameStateFactory.create()
	game_ui.set_game_state(game_state)
	
	game_ui.advance_nation_requested.connect(_on_advance_nation_requested)
	game_ui.move_back_nation_requested.connect(_on_move_back_nation_requested)


func _on_advance_nation_requested(nation: Enums.Nation) -> void:
	if PoliticalLogic.can_advance_nation(game_state, nation):
		var action: GameAction = PoliticalLogic.create_advance_nation_action(nation)
		if action.can_apply(game_state):
			action.apply(game_state)
			# Add action to history


func _on_move_back_nation_requested(nation: Enums.Nation) -> void:
	if PoliticalLogic.can_move_back_nation(game_state, nation):
		var action: GameAction = PoliticalLogic.create_move_back_nation_action(nation)
		if action.can_apply(game_state):
			action.apply(game_state)
			# Add action to history
