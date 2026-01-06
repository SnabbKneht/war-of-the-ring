class_name MapStateFactory
extends RefCounted


static func create() -> MapState:
	var map_state: MapState = MapState.new()
	for region_data: RegionData in GameData.get_all_region_data():
		map_state._region_states[region_data.id] = RegionState.new(region_data)
	return map_state
