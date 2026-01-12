class_name MapRoot
extends Node2D


@onready var color_sprite: Sprite2D = $RegionColorMap
var game_state: GameState


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var image_pos: Vector2 = color_sprite.to_local(get_global_mouse_position()) + color_sprite.texture.get_size() * 0.5
		var image_bounds: Rect2 = Rect2(Vector2.ZERO, color_sprite.texture.get_size())
		if(not image_bounds.has_point(image_pos)):
			return
		var color_clicked: Color = color_sprite.texture.get_image().get_pixelv(image_pos)
		if color_clicked in UIData.get_all_region_colors():
			var region_id: int = UIData.get_region_id_by_color(color_clicked)
			print(game_state.map_state.get_region_state_by_id(region_id).get_info())
		else:
			print("Unknown region")
