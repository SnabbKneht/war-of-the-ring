class_name MapView
extends Node2D


@onready var color_sprite: Sprite2D = $RegionColorMap
@onready var regions_node: Node2D = $Regions


var _map_state: MapState
var _region_views: Dictionary[int, RegionView] = {}


func _input(event: InputEvent) -> void:
	_handle_region_click(event)


func set_map_state(map_state: MapState) -> void:
	_map_state = map_state
	_init_region_views()


func _init_region_views() -> void:
	for region_view: RegionView in regions_node.get_children():
		_region_views[region_view.region_id] = region_view
		region_view.set_region_state(_map_state.get_region_state_by_id(region_view.region_id))


func _handle_region_click(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var image_pos: Vector2 = color_sprite.to_local(get_global_mouse_position()) + color_sprite.texture.get_size() * 0.5
		var image_bounds: Rect2 = Rect2(Vector2.ZERO, color_sprite.texture.get_size())
		if(not image_bounds.has_point(image_pos)):
			return
		var color_clicked: Color = color_sprite.texture.get_image().get_pixelv(image_pos)
		if color_clicked in UIData.get_all_region_colors():
			var region_id: int = UIData.get_region_id_by_color(color_clicked)
			print(_map_state.get_region_state_by_id(region_id))
		else:
			print("Unknown region")
