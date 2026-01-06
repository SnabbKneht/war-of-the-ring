class_name MapValidator
extends RefCounted


static func validate_all() -> void:
	validate_region_count()
	validate_region_ids()
	validate_no_null_regions()
	validate_no_null_neighbors()
	validate_no_self_neighbors()
	validate_mutual_neighbors()


static func validate_region_count() -> void:
	assert(GameData.get_all_region_data().size() == 105, "Region count mismatch: is " + str(GameData.get_all_region_data().size()) + ", should be 105.")


static func validate_region_ids() -> void:
	for id: int in range(1, 106):
		assert(GameData.get_all_region_ids().has(id), "Missing region id: " + str(id))


static func validate_no_null_regions() -> void:
	for id: int in range(1, 106):
		assert(GameData.get_region_by_id(id) != null, "Region " + str(id) + " is null")


static func validate_no_null_neighbors() -> void:
	for region_data: RegionData in GameData.get_all_region_data():
		for neighbor_id: int in region_data.neighbors:
			assert(GameData.get_region_by_id(neighbor_id) != null, "Region " + str(region_data.id) + " has a null neighbor.")


static func validate_no_self_neighbors() -> void:
	for region_data: RegionData in GameData.get_all_region_data():
		assert(region_data.id not in region_data.neighbors, "Region " + str(region_data.id) + " is its own neighbor.")


static func validate_mutual_neighbors() -> void:
	for region: RegionData in GameData.get_all_region_data():
		for neighbor_id: int in region.neighbors:
			var neighbor: RegionData = GameData.get_region_by_id(neighbor_id)
			assert(neighbor.neighbors.has(region.id), "Neighbor mismatch: Region " + str(neighbor_id) + " is a neighbor of region " + str(region.id) + " but not the other way around.")
