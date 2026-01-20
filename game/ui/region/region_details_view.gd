class_name RegionDetailsView
extends PanelContainer


@onready var region_label: Label = $MarginContainer/VBoxContainer/PanelContainer/RegionLabel
@onready var nation_label: Label = $MarginContainer/VBoxContainer/PanelContainer2/NationLabel
@onready var structure_icon: TextureRect = $MarginContainer/VBoxContainer/StructureContainer/PanelContainer/StructureIcon
@onready var structure_container: HBoxContainer = $MarginContainer/VBoxContainer/StructureContainer
@onready var stronghold_piece_view: PieceView = $MarginContainer/VBoxContainer/StructureContainer/StrongholdPieceView
@onready var region_piece_view: PieceView = $MarginContainer/VBoxContainer/RegionPieceView


var _region_state: RegionState


func set_region_state(region_state: RegionState) -> void:
	_region_state = region_state
	_refresh()


func _refresh() -> void:
	_refresh_region_label()
	_refresh_nation_details()
	_refresh_structure_details()
	_refresh_region_piece_view()


func _refresh_region_label() -> void:
	region_label.text = _region_state.region_data.name


func _refresh_nation_details() -> void:
	if _region_state.belongs_to_any_nation():
		nation_label.text = UIData.get_nation_name(_region_state.region_data.nation)
		nation_label.show()
	else:
		nation_label.hide()


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
		structure_icon.texture = UIData.get_settlement_icon(_region_state.controlled_by, _region_state.region_data.structure)
	elif _region_state.has_fortification():
		structure_icon.texture = UIData.get_fortification_icon()


func _refresh_stronghold_piece_view() -> void:
	pass


func _refresh_region_piece_view() -> void:
	pass
