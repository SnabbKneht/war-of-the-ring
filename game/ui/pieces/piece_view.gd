class_name PieceView
extends PanelContainer


@onready var free_peoples_list: ItemList = $VBoxContainer/HBoxContainer/FreeContainer/FreePieces
@onready var shadow_list: ItemList = $VBoxContainer/HBoxContainer/ShadowContainer/ShadowPieces
@onready var free_container: VBoxContainer = $VBoxContainer/HBoxContainer/FreeContainer
@onready var shadow_container: VBoxContainer = $VBoxContainer/HBoxContainer/ShadowContainer


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
		free_container.show()
	if shadow_list.item_count > 0:
		shadow_container.show()


func _add_to_free_peoples_list(piece: Piece) -> void:
	free_peoples_list.add_item(UIData.get_piece_name(piece.get_piece_type_id()))


func _add_to_shadow_list(piece: Piece) -> void:
	shadow_list.add_item(UIData.get_piece_name(piece.get_piece_type_id()))


func _clear_lists() -> void:
	free_peoples_list.clear()
	shadow_list.clear()
	free_container.hide()
	shadow_container.hide()
