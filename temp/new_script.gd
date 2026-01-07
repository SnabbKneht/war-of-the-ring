extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RegionDataValidator.validate_all()
	print("Map validation finished")
	
	var game_state: GameState = GameStateFactory.create()
	print("Game state created")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
