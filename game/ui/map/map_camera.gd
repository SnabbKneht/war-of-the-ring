class_name MapCamera
extends Camera2D


var _is_panning: bool = false
@export var zoom_sensitivity: float = 1.0
@export var min_zoom: float = 1.0
@export var max_zoom: float = 1.0
@export var boundary: Rect2


func _unhandled_input(event: InputEvent) -> void:
	_handle_panning(event)
	_handle_zoom(event)


func _handle_panning(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_is_panning = event.pressed
	
	if _is_panning and event is InputEventMouseMotion:
		translate(event.relative / zoom * -1)
		position = position.clamp(boundary.position, boundary.end)


func _handle_zoom(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				_zoom_in()
			MOUSE_BUTTON_WHEEL_DOWN:
				_zoom_out()


func _zoom_in() -> void:
	zoom *= 1.0 + zoom_sensitivity
	zoom = zoom.clampf(min_zoom, max_zoom)


func _zoom_out() -> void:
	zoom /= 1.0 + zoom_sensitivity
	zoom = zoom.clampf(min_zoom, max_zoom)
