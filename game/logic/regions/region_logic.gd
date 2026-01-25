class_name RegionLogic
extends RefCounted


static func is_region_free(game_state: GameState, region_id: int, point_of_view: Enums.Side) -> bool:
	assert(point_of_view != Enums.Side.NONE)
	var region_state: RegionState = game_state.map_state.get_region_state_by_id(region_id)
	if region_state.get_army_side() == Enums.opposing_side(point_of_view):
		return false
	elif region_state.get_controlling_side() == Enums.opposing_side(point_of_view):
		return false
	else:
		return true


static func is_region_free_for_army(game_state: GameState, region_id: int, point_of_view: Enums.Side) -> bool:
	assert(point_of_view != Enums.Side.NONE)
	var region_state: RegionState = game_state.map_state.get_region_state_by_id(region_id)
	return region_state.get_army_side() != Enums.opposing_side(point_of_view)
