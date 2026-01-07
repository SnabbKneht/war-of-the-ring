extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RegionDataValidator.validate_all()
	print("Region data validation finished")
	
	PieceDataValidator.validate_all()
	print("Piece data validation finished")
	
	var game_state: GameState = GameStateFactory.create()
	print("Game state created")
	
	print_game_state(game_state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func print_game_state(game_state: GameState) -> void:
	print("\nREGIONS\n")
	for region_state: RegionState in game_state.map_state._region_states.values():
		print(region_state.region_data.name + ": " + str(region_state._pieces))
	
	print("\nREINFORCEMENTS:\n")
	for piece: Piece in game_state.reinforcements._free_peoples:
		print(piece)
	for piece: Piece in game_state.reinforcements._shadow:
		print(piece)
