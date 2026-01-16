class_name PoliticalState
extends RefCounted


var _nation_to_state: Dictionary[Enums.Nation, NationState] = {}


func get_nation_step(nation: Enums.Nation) -> int:
	assert(nation in _nation_to_state.keys())
	return _nation_to_state[nation].get_step()


func is_nation_active(nation: Enums.Nation) -> bool:
	assert(nation in _nation_to_state.keys())
	return _nation_to_state[nation].is_active()
