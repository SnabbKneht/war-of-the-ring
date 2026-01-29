class_name MapView
extends Node2D


signal region_selected(region_id: int)
signal region_deselected
signal region_hovered(region_id: int)


@onready var color_sprite: Sprite2D = $RegionColorMap
@onready var region_highlight_overlay: RegionShaderOverlay = $Overlays/RegionHighlightOverlay
@onready var region_select_overlay: RegionShaderOverlay = $Overlays/RegionSelectOverlay
@onready var regions_node: Node2D = $Regions


var _map_state: MapState
var _region_views: Dictionary[int, MapRegionView] = {}


func _unhandled_input(event: InputEvent) -> void:
	_handle_region_click(event)
	_handle_region_hover(event)


func set_map_state(map_state: MapState) -> void:
	_map_state = map_state
	_init_region_views()


func highlight_regions(region_ids: Array[int]) -> void:
	region_highlight_overlay.enable(region_ids)


func draw_selection_border(region_ids: Array[int]) -> void:
	region_select_overlay.enable(region_ids)


func clear_selection_border() -> void:
	region_select_overlay.disable()


func _init_region_views() -> void:
	for region_view: MapRegionView in regions_node.get_children():
		_region_views[region_view.region_id] = region_view
		region_view.set_region_state(_map_state.get_region_state_by_id(region_view.region_id))


func _handle_region_click(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var region_id: int = _get_region_id_at_mouse_pos()
		if region_id in GameData.get_all_region_ids():
			region_selected.emit(region_id)
		else:
			region_deselected.emit()


func _handle_region_hover(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var region_id: int = _get_region_id_at_mouse_pos()
		region_hovered.emit(region_id)


func _get_region_id_at_mouse_pos() -> int:
	var image_pos: Vector2 = color_sprite.to_local(get_global_mouse_position()) + color_sprite.texture.get_size() * 0.5
	var image_bounds: Rect2 = Rect2(Vector2.ZERO, color_sprite.texture.get_size())
	if(not image_bounds.has_point(image_pos)):
		return 0
	var color: Color = color_sprite.texture.get_image().get_pixelv(image_pos)
	if color in UIData.get_all_region_colors():
		var region_id: int = UIData.get_region_id_by_color(color)
		return region_id
	else:
		return 0
