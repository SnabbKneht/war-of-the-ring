class_name PiecesInitialPopulator
extends RefCounted


static func populate(game_state: GameState) -> void:
	var region_pieces: Array[StringName] = []
	
	for region_setup: RegionInitialPiecesSetup in GameData.get_all_region_initial_pieces_setups():
		for piece_id: StringName in region_setup.piece_ids:
			var piece: Piece = game_state.piece_pool.get_piece(piece_id)
			game_state.map_state.add_piece_to_region(region_setup.region_id, piece)
			region_pieces.append(piece_id)
	
	for piece: Piece in game_state.piece_pool.get_all_pieces():
		if piece.get_id() not in region_pieces:
			game_state.reinforcements.add(piece)
