class_name PieceView
extends PanelContainer


signal selection_changed


@onready var free_peoples_list: ItemList = $VBoxContainer/HBoxContainer/FreeContainer/FreePieces
@onready var shadow_list: ItemList = $VBoxContainer/HBoxContainer/ShadowContainer/ShadowPieces
@onready var free_container: VBoxContainer = $VBoxContainer/HBoxContainer/FreeContainer
@onready var shadow_container: VBoxContainer = $VBoxContainer/HBoxContainer/ShadowContainer


var _pieces: Array[Piece] = []
var _fp_list_idx_to_piece: Dictionary[int, Piece] = {}
var _sh_list_idx_to_piece: Dictionary[int, Piece] = {}


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


func get_selected_piece_ids() -> Array[StringName]:
	assert(free_peoples_list.get_selected_items().is_empty() or shadow_list.get_selected_items().is_empty())
	var selected_piece_ids: Array[StringName] = []
	for idx: int in free_peoples_list.get_selected_items():
		selected_piece_ids.append(_fp_list_idx_to_piece[idx].get_id())
	for idx: int in shadow_list.get_selected_items():
		selected_piece_ids.append(_sh_list_idx_to_piece[idx].get_id())
	return selected_piece_ids


func _add_to_free_peoples_list(piece: Piece) -> void:
	var index: int = free_peoples_list.add_item(UIData.get_piece_name(piece.get_piece_type_id()))
	_fp_list_idx_to_piece[index] = piece


func _add_to_shadow_list(piece: Piece) -> void:
	var index: int = shadow_list.add_item(UIData.get_piece_name(piece.get_piece_type_id()))
	_sh_list_idx_to_piece[index] = piece


func _clear_lists() -> void:
	free_peoples_list.clear()
	shadow_list.clear()
	_fp_list_idx_to_piece.clear()
	_sh_list_idx_to_piece.clear()
	free_container.hide()
	shadow_container.hide()


func _on_fp_list_multi_selected(_index: int, _selected: bool) -> void:
	shadow_list.deselect_all()
	selection_changed.emit()


func _on_sh_list_multi_selected(_index: int, _selected: bool) -> void:
	free_peoples_list.deselect_all()
	selection_changed.emit()
