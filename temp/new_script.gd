extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MapValidator.validate_all()
	print("Finished")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
