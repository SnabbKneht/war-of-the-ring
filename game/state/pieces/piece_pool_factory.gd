class_name PiecePoolFactory
extends RefCounted


static func create() -> PiecePool:
	var piece_pool: PiecePool = PiecePool.new()
	for id: StringName in GameData.get_all_piece_ids():
		piece_pool._pieces[id] = Piece.new(id, GameData.get_piece_type_by_piece_id(id))
	return piece_pool
