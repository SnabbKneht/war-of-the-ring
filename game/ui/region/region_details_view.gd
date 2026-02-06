class_name RegionDetailsView
extends PanelContainer


signal neighbor_highlight_requested(region_id: int)
signal neighbor_highlight_cancelled(region_id: int)
signal army_movement_mode_requested(piece_ids: Array[StringName], from_region_id: int)


@onready var region_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/RegionLabel
@onready var nation_icon: TextureRect = $MarginContainer/NationIcon
@onready var neighbor_icon: TextureRect = $MarginContainer/NeighborIcon
@onready var structure_icon: TextureRect = $MarginContainer/VBoxContainer/StructureContainer/PanelContainer/StructureIcon
@onready var structure_container: HBoxContainer = $MarginContainer/VBoxContainer/StructureContainer
@onready var stronghold_piece_view: PieceView = $MarginContainer/VBoxContainer/StructureContainer/StrongholdPieceView
@onready var region_piece_view: PieceView = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/RegionPieceView
@onready var move_button: Button = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/ArmyButtons/MoveButton
@onready var attack_button: Button = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/ArmyButtons/AttackButton


var _region_state: RegionState


func _ready() -> void:
	region_piece_view.selection_changed.connect(_refresh_army_buttons_availability)


func set_region_state(region_state: RegionState) -> void:
	_region_state = region_state
	_refresh()


func _refresh() -> void:
	_refresh_region_label()
	_refresh_nation_icon()
	_refresh_neighbor_icon()
	_refresh_structure_details()
	_refresh_region_piece_view()
	_refresh_army_buttons_availability()


func _refresh_region_label() -> void:
	region_label.text = _region_state.region_data.name


func _refresh_nation_icon() -> void:
	if _region_state.belongs_to_any_nation():
		nation_icon.texture = UIData.get_nation_icon(_region_state.region_data.nation)
		nation_icon.show()
	else:
		nation_icon.hide()


func _refresh_neighbor_icon() -> void:
	neighbor_icon.texture = UIData.get_neighbor_icon(_region_state.get_neighbor_count())


func _refresh_structure_details() -> void:
	if not _region_state.has_structure():
		structure_container.hide()
	elif _region_state.has_stronghold():
		structure_container.show()
		stronghold_piece_view.show()
		_refresh_structure_icon()
		_refresh_stronghold_piece_view()
	else:
		structure_container.show()
		stronghold_piece_view.hide()
		_refresh_structure_icon()


func _refresh_structure_icon() -> void:
	assert(_region_state.has_fortification() or _region_state.has_settlement())
	if _region_state.has_settlement():
		structure_icon.texture = UIData.get_settlement_icon(_region_state.get_controlling_side(), _region_state.region_data.structure)
	elif _region_state.has_fortification():
		structure_icon.texture = UIData.get_fortification_icon()


func _refresh_stronghold_piece_view() -> void:
	stronghold_piece_view.hide()


func _refresh_region_piece_view() -> void:
	if _region_state.has_any_pieces():
		region_piece_view.display(_region_state.get_pieces())
		region_piece_view.show()
	else:
		region_piece_view.hide()


func _refresh_army_buttons_availability() -> void:
	if region_piece_view.get_selected_piece_ids().is_empty():
		move_button.disabled = true
	else:
		move_button.disabled = false
	attack_button.disabled = true


func _on_neighbor_icon_mouse_entered() -> void:
	neighbor_highlight_requested.emit(_region_state.get_id())


func _on_neighbor_icon_mouse_exited() -> void:
	neighbor_highlight_cancelled.emit(_region_state.get_id())


func _on_move_button_pressed() -> void:
	army_movement_mode_requested.emit(region_piece_view.get_selected_piece_ids(), _region_state.get_id())


func _on_attack_button_pressed() -> void:
	pass # Replace with function body.
