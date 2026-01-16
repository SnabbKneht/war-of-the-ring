class_name NationState
extends RefCounted


const _MIN_POLITICAL_STEP: int = 1
const _MAX_POLITICAL_STEP: int = 4


var _nation: Enums.Nation
var _political_step: int
var _is_active: bool


func _init(nation: Enums.Nation, political_step: int, is_active: bool) -> void:
	_nation = nation
	_political_step = political_step
	_is_active = is_active


func get_nation() -> Enums.Nation:
	return _nation


func advance() -> void:
	if _political_step < _MAX_POLITICAL_STEP:
		_political_step += 1


func move_back() -> void:
	if _political_step > _MIN_POLITICAL_STEP:
		_political_step -= 1


func activate() -> void:
	_is_active = true
