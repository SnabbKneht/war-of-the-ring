class_name MapValidator


static func validate_all() -> void:
	validate_region_count()
	validate_region_ids()
	validate_no_null_regions()
	validate_no_null_neighbors()
	validate_no_self_neighbors()
	validate_mutual_neighbors()


static func validate_region_count() -> void:
	assert(RegionDatabase.regions.size() == 105, "Region count mismatch: is " + str(RegionDatabase.regions.size()) + ", should be 105.")


static func validate_region_ids() -> void:
	for id: int in range(1, 106):
		assert(RegionDatabase.regions.keys().has(id), "Missing region id: " + str(id))


static func validate_no_null_regions() -> void:
	for id: int in RegionDatabase.regions.keys():
		assert(RegionDatabase.get_region(id) != null, "Region " + str(id) + " is null")


static func validate_no_null_neighbors() -> void:
	for id: int in RegionDatabase.regions.keys():
		var region: RegionData = RegionDatabase.get_region(id)
		for neighbor_id: int in region.neighbors:
			assert(RegionDatabase.get_region(neighbor_id) != null, "Region " + str(id) + " has a null neighbor.")


static func validate_no_self_neighbors() -> void:
	for id: int in RegionDatabase.regions.keys():
		var region: RegionData = RegionDatabase.get_region(id)
		assert(region.id not in region.neighbors, "Region " + str(id) + " is its own neighbor.")


static func validate_mutual_neighbors() -> void:
	for id: int in RegionDatabase.regions.keys():
		var region: RegionData = RegionDatabase.get_region(id)
		for neighbor_id: int in region.neighbors:
			var neighbor: RegionData = RegionDatabase.get_region(neighbor_id)
			assert(neighbor.neighbors.has(region.id), "Neighbor mismatch: Region " + str(neighbor_id) + " is a neighbor of region " + str(region.id) + " but not the other way around.")
