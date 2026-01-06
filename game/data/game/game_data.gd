extends Node


const GAME_DATA_PATH: String = "res://game/data/game/game_data_resource.tres"


var _data: GameDataResource = preload(GAME_DATA_PATH)


var _region_by_id: Dictionary[int, RegionData] = {}


func _init() -> void:
	_init_region_dictionary()


func get_all_region_data() -> Array[RegionData]:
	return _data.all_region_data


func get_region_by_id(id: int) -> RegionData:
	return _region_by_id[id]


func get_all_region_initial_pieces_setups() -> Array[RegionInitialPiecesSetup]:
	return _data.all_region_initial_pieces_setups


func get_all_reinforcement_initial_setups() -> Array[ReinforcementInitialSetup]:
	return _data.all_reinforcement_initial_setups


func get_base_game_piece_inventory() -> PieceInventory:
	return _data.base_game_piece_inventory


func _init_region_dictionary() -> void:
	for region_data: RegionData in get_all_region_data():
		_region_by_id[region_data.id] = region_data
