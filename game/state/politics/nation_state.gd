class_name NationState
extends RefCounted


const _MIN_POLITICAL_STEP: int = 1
const _MAX_POLITICAL_STEP: int = 4


var _nation: Enums.Nation
var _political_step: int
var _is_active: bool


func _init(p_nation: Enums.Nation, p_political_step: int, p_is_active: bool) -> void:
	_nation = p_nation
	_political_step = p_political_step
	_is_active = p_is_active


func get_nation() -> Enums.Nation:
	return _nation


func get_step() -> int:
	return _political_step


func is_active() -> bool:
	return _is_active


func advance() -> void:
	if _political_step < _MAX_POLITICAL_STEP:
		_political_step += 1


func move_back() -> void:
	if _political_step > _MIN_POLITICAL_STEP:
		_political_step -= 1


func activate() -> void:
	_is_active = true
