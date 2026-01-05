class_name PiecePoolFactory
extends RefCounted


static func create() -> PiecePool:
	var inventory: PieceInventory = preload(GamePaths.PIECE_INVENTORY_RES)
	var piece_pool: PiecePool = PiecePool.new()
	var next_id: int = 1
	for entry: PieceInventoryEntry in inventory.entries:
		for i: int in range(entry.count):
			piece_pool.pieces[next_id] = Piece.new(next_id, entry.piece_type)
			next_id += 1
	return piece_pool
