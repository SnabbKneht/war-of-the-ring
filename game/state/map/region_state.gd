class_name RegionState
extends RefCounted


signal changed


func _init(p_region_data: RegionData) -> void:
	region_data = p_region_data
	controlled_by = region_data.side
	is_conquered = false


var region_data: RegionData
var _pieces: Array[Piece] = []
var controlled_by: Enums.Side
var is_conquered: bool


func add_piece(piece: Piece) -> void:
	_pieces.append(piece)
	changed.emit()


func add_pieces(pieces: Array[Piece]) -> void:
	_pieces.append_array(pieces)
	changed.emit()


func remove_pieces(pieces: Array[Piece]) -> void:
	for p: Piece in pieces:
		assert(_pieces.has(p))
		_pieces.erase(p)
	changed.emit()


func get_pieces() -> Array[Piece]:
	return _pieces


func has_any_pieces() -> bool:
	return _pieces.size() > 0


func has_settlement() -> bool:
	return region_data.structure in [
		Enums.RegionStructure.TOWN,
		Enums.RegionStructure.CITY,
		Enums.RegionStructure.STRONGHOLD
	]


func has_stronghold() -> bool:
	return region_data.structure == Enums.RegionStructure.STRONGHOLD


func has_structure() -> bool:
	return region_data.structure != Enums.RegionStructure.NONE


func has_fortification() -> bool:
	return region_data.structure == Enums.RegionStructure.FORTIFICATION


func belongs_to_any_nation() -> bool:
	return region_data.nation != Enums.Nation.NONE


func get_neighbor_count() -> int:
	return region_data.neighbors.size()


func _to_string() -> String:
	var info: String = region_data.name + ": " + str(_pieces)
	return info
