class_name RegionStateFactory
extends RefCounted


static func create(region_id: int) -> RegionState:
	var region_state: RegionState = RegionState.new()
	region_state.region_data = RegionDatabase.get_region(region_id)
	region_state.controlled_by = region_state.region_data.side
	region_state.is_conquered = false
	return region_state
