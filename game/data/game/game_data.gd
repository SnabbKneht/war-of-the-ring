# autoload GameData
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


func get_all_region_ids() -> Array[int]:
	return _region_by_id.keys()


func get_all_piece_types() -> Array[PieceType]:
	return _data.all_piece_types


func get_all_region_initial_pieces_setups() -> Array[RegionInitialPiecesSetup]:
	return _data.all_region_initial_pieces_setups


func get_all_reinforcement_initial_setups() -> Array[ReinforcementInitialSetup]:
	return _data.all_reinforcement_initial_setups


func get_all_piece_ids() -> Array[StringName]:
	return _data.base_game_piece_inventory.pieces.keys()


func get_piece_type_by_piece_id(piece_id: StringName) -> PieceType:
	assert(piece_id in _data.base_game_piece_inventory.pieces.keys())
	return _data.base_game_piece_inventory.pieces[piece_id]


func get_all_nation_initial_setups() -> Array[NationInitialSetup]:
	return _data.all_nation_initial_setups


func _init_region_dictionary() -> void:
	for region_data: RegionData in get_all_region_data():
		_region_by_id[region_data.id] = region_data
