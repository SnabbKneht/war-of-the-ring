class_name MapRoot
extends Node2D


@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		var color_clicked: Color = sprite_2d.texture.get_image().get_pixelv(event.position)
		if color_clicked in UIData.get_all_region_colors():
			var region_id: int = UIData.get_region_id_by_color(color_clicked)
			print(GameData.get_region_by_id(region_id).name)
		else:
			print("Unknown region")
