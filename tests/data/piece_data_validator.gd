class_name PieceDataValidator
extends RefCounted


static func validate_all() -> void:
	_validate_piece_type_count()
	_validate_piece_type_unique_ids()
	_validate_piece_count()


static func _validate_piece_type_count() -> void:
	assert(GameData.get_all_piece_types().size() == 21)


static func _validate_piece_type_unique_ids() -> void:
	var seen: Array[String] = []
	for piece_type: PieceType in GameData.get_all_piece_types():
		assert(not seen.has(piece_type.id), "Duplicate piece type id: " + str(piece_type.id))
		seen.append(piece_type.id)


static func _validate_piece_count() -> void:
	var total_pieces: int = 0
	for region_setup: RegionInitialPiecesSetup in GameData.get_all_region_initial_pieces_setups():
		total_pieces += region_setup.pieces.size()
	for reinforcement_setup: ReinforcementInitialSetup in GameData.get_all_reinforcement_initial_setups():
		total_pieces += reinforcement_setup.pieces.size()
	assert(total_pieces == 185, "Total piece count mismatch: is " + str(total_pieces) + ", should be 185")
