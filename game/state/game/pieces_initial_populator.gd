class_name PiecesInitialPopulator
extends RefCounted


static func populate(game_state: GameState) -> void:
	_populate_regions(game_state)
	_populate_reinforcements(game_state)


static func _populate_regions(game_state: GameState) -> void:
	for region_setup: RegionInitialPiecesSetup in GameData.get_all_region_initial_pieces_setups():
		for piece_type: PieceType in region_setup.pieces:
			var new_piece: Piece = game_state.piece_pool.create_new_piece(piece_type)
			game_state.map_state.add_piece_to_region(region_setup.region_id, new_piece)


static func _populate_reinforcements(game_state: GameState) -> void:
	for reinforcement_setup: ReinforcementInitialSetup in GameData.get_all_reinforcement_initial_setups():
		for piece_type: PieceType in reinforcement_setup.pieces:
			var new_piece: Piece = game_state.piece_pool.create_new_piece(piece_type)
			game_state.reinforcements.add(new_piece)
