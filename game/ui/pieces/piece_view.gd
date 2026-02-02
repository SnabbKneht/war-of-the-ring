class_name PieceView
extends PanelContainer


signal army_movement_mode_requested(piece_ids: Array[StringName])


@onready var free_peoples_list: ItemList = $VBoxContainer/HBoxContainer/FreeContainer/FreePieces
@onready var shadow_list: ItemList = $VBoxContainer/HBoxContainer/ShadowContainer/ShadowPieces
@onready var free_container: VBoxContainer = $VBoxContainer/HBoxContainer/FreeContainer
@onready var shadow_container: VBoxContainer = $VBoxContainer/HBoxContainer/ShadowContainer
@onready var move_button_fp: Button = $VBoxContainer/HBoxContainer/FreeContainer/HBoxContainer/MoveButtonFP
@onready var move_button_sh: Button = $VBoxContainer/HBoxContainer/ShadowContainer/HBoxContainer/MoveButtonSH


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


func _on_move_button_fp_pressed() -> void:
	if free_peoples_list.get_selected_items().is_empty():
		return
	var selected_piece_ids: Array[StringName] = []
	for idx: int in free_peoples_list.get_selected_items():
		selected_piece_ids.append(_fp_list_idx_to_piece[idx].get_id())
	army_movement_mode_requested.emit(selected_piece_ids)


func _on_move_button_sh_pressed() -> void:
	if shadow_list.get_selected_items().is_empty():
		return
	var selected_piece_ids: Array[StringName] = []
	for idx: int in shadow_list.get_selected_items():
		selected_piece_ids.append(_sh_list_idx_to_piece[idx].get_id())
	army_movement_mode_requested.emit(selected_piece_ids)
