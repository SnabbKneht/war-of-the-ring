class_name MapStateFactory
extends RefCounted


static func create() -> MapState:
	var map_state: MapState = MapState.new()
	for region_id: int in RegionDatabase.get_all_region_ids():
		map_state.region_states[region_id] = RegionStateFactory.create(region_id)
	return map_state
