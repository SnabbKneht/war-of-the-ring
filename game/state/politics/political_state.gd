class_name PoliticalState
extends RefCounted


var _nation_to_state: Dictionary[Enums.Nation, NationState] = {}


func get_nation_step(nation: Enums.Nation) -> int:
	assert(nation in _nation_to_state.keys())
	return _nation_to_state[nation].get_step()


func is_nation_at_war(nation: Enums.Nation) -> bool:
	return get_nation_state(nation).is_at_war()


func is_nation_active(nation: Enums.Nation) -> bool:
	assert(nation in _nation_to_state.keys())
	return _nation_to_state[nation].is_active()


func get_nation_state(nation: Enums.Nation) -> NationState:
	assert(nation in _nation_to_state.keys())
	return _nation_to_state[nation]


func advance_nation(nation: Enums.Nation) -> void:
	get_nation_state(nation).advance()


func move_back_nation(nation: Enums.Nation) -> void:
	get_nation_state(nation).move_back()
