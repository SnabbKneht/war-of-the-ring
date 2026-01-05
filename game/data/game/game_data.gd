class_name GameData
extends RefCounted


const GAME_DATA_PATH: String = "res://game/data/game/game_data_resource.tres"


static var _data: GameDataResource = preload(GAME_DATA_PATH)


static func get_all_region_data() -> Array[RegionData]:
	return _data.all_region_data


static func get_all_region_initial_pieces_setups() -> Array[RegionInitialPiecesSetup]:
	return _data.all_region_initial_pieces_setups


static func get_all_reinforcement_initial_setups() -> Array[ReinforcementInitialSetup]:
	return _data.all_reinforcement_initial_setups


static func get_base_game_piece_inventory() -> PieceInventory:
	return _data.base_game_piece_inventory
