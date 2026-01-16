class_name GameStateFactory
extends RefCounted


static func create() -> GameState:
	var game_state: GameState = GameState.new()
	game_state.map_state = MapStateFactory.create()
	PiecesInitialPopulator.populate(game_state)
	game_state.political_state = PoliticalStateFactory.create()
	return game_state
