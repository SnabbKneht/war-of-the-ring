extends Node


const regions_directory: String = "res://game/data/resources/regions/"


var regions: Dictionary[int, RegionData] = {}


func _ready() -> void:
	load_all_regions()


func _process(_delta: float) -> void:
	pass


func load_all_regions() -> void:
	for file: String in DirAccess.get_files_at(regions_directory):
		var region: RegionData = load(regions_directory + file)
		regions[region.id] = region


func get_region(id: int) -> RegionData:
	return regions[id]


func get_all_region_data() -> Array[RegionData]:
	return regions.values()


func get_all_region_ids() -> Array[int]:
	return regions.keys()
