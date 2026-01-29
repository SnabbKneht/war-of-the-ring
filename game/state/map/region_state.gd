class_name RegionState
extends RefCounted


signal changed


func _init(p_region_data: RegionData) -> void:
	region_data = p_region_data
	_controlled_by = region_data.side
	_is_conquered = false


var region_data: RegionData
var _pieces: Array[Piece] = []
var _controlled_by: Enums.Side
var _is_conquered: bool


func get_id() -> int:
	return region_data.id


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


func get_army_side() -> Enums.Side:
	if _pieces.is_empty():
		return Enums.Side.NONE
	for piece: Piece in _pieces:
		if piece.is_army_unit():
			return piece.get_side()
	return Enums.Side.NONE


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


func get_controlling_side() -> Enums.Side:
	if has_settlement():
		if _is_conquered:
			return Enums.opposing_side(region_data.side)
		else:
			return region_data.side
	else:
		return Enums.Side.NONE


func get_neighbor_count() -> int:
	return region_data.neighbors.size()


func _to_string() -> String:
	var info: String = region_data.name + ": " + str(_pieces)
	return info
