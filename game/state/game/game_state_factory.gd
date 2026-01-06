class_name GameStateFactory
extends RefCounted


static func create() -> GameState:
	var game_state: GameState = GameState.new()
	game_state.map_state = MapStateFactory.create()
	PiecesInitialPopulator.populate(game_state)
	return game_state
