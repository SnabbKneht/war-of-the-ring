class_name RegionView
extends Node2D


@onready var _combat_label: Label = $ArmyPanel/CombatLabel
@onready var _army_panel: Panel = $ArmyPanel
@onready var _leadership_panel: Panel = $ArmyPanel/LeadershipPanel
@onready var _leadership_label: Label = $ArmyPanel/LeadershipPanel/LeadershipLabel
@onready var structure_view: StructureView = $StructureView


@export var region_id: int = 0
var _region_state: RegionState


func set_region_state(region_state: RegionState) -> void:
	_region_state = region_state
	_region_state.changed.connect(_refresh)
	_refresh()


func _refresh() -> void:
	if _region_state.get_army_side() == Enums.Side.NONE:
		_army_panel.hide()
	else:
		_army_panel.show()
		_refresh_combat_label()
		_refresh_leadership_panel()
		_refresh_tooltip()
		_refresh_theme()
	_refresh_structure_view()


func _refresh_combat_label() -> void:
	_combat_label.text = str(_region_state.get_total_combat_value())


func _refresh_leadership_panel() -> void:
	if _region_state.get_total_leadership_value() == 0:
		_leadership_panel.hide()
	else:
		_leadership_panel.show()
		_leadership_label.text = str(_region_state.get_total_leadership_value())


func _refresh_tooltip() -> void:
	var text: String = ""
	for piece: Piece in _region_state.get_pieces():
		text += piece.piece_type.id + "\n"
	_army_panel.tooltip_text = text


func _refresh_theme() -> void:
	if _region_state.get_army_side() == Enums.Side.FREE_PEOPLES:
		_army_panel.theme = UIData.get_free_peoples_theme()
	else:
		_army_panel.theme = UIData.get_shadow_theme()


func _refresh_structure_view() -> void:
	if _region_state.region_data.structure == Enums.RegionStructure.NONE:
		structure_view.hide()
	elif _region_state.region_data.structure == Enums.RegionStructure.FORTIFICATION:
		structure_view.display_fortification()
		structure_view.show()
	else:
		structure_view.display_settlement(_region_state.controlled_by, _region_state.region_data.structure)
		structure_view.show()
