class_name PieceView
extends PanelContainer


@onready var free_peoples_list: ItemList = $HBoxContainer/FreePieces
@onready var shadow_list: ItemList = $HBoxContainer/ShadowPieces


var _pieces: Array[Piece]


func display(pieces: Array[Piece]) -> void:
	_pieces = pieces
	_clear_lists()
	for piece: Piece in pieces:
		if piece.get_side() == Enums.Side.FREE_PEOPLES:
			_add_to_free_peoples_list(piece)
		else:
			_add_to_shadow_list(piece)
	if free_peoples_list.item_count > 0:
		free_peoples_list.show()
	if shadow_list.item_count > 0:
		shadow_list.show()


func _add_to_free_peoples_list(piece: Piece) -> void:
	free_peoples_list.add_item(UIData.get_piece_name(piece.piece_type.id))


func _add_to_shadow_list(piece: Piece) -> void:
	shadow_list.add_item(UIData.get_piece_name(piece.piece_type.id))


func _clear_lists() -> void:
	free_peoples_list.clear()
	shadow_list.clear()
	free_peoples_list.hide()
	shadow_list.hide()
