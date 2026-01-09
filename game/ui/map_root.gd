class_name MapRoot
extends Node2D


@onready var sprite_2d: Sprite2D = $Sprite2D


var color_to_region: Dictionary[Color, int] = preload("res://game/ui/color_to_region.tres").color_to_region


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var color_clicked: Color = sprite_2d.texture.get_image().get_pixelv(event.position)
		if color_clicked in color_to_region.keys():
			print(GameData.get_region_by_id(color_to_region[color_clicked]).name)
		else:
			print("Unknown region")
