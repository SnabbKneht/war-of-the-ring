class_name MapCamera
extends Camera2D


var _is_panning: bool = false
var _mouse_delta: Vector2 = Vector2.ZERO


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_is_panning = event.pressed
	
	if _is_panning and event is InputEventMouseMotion:
		_mouse_delta = event.relative
		translate(_mouse_delta * -1)
