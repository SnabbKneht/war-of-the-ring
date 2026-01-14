class_name RegionView
extends Node2D


@onready var _combat_label: Label = $ArmyPanel/CombatLabel
@onready var _army_panel: Panel = $ArmyPanel


@export var region_id: int = 0
var _region_state: RegionState


func set_region_state(region_state: RegionState) -> void:
	_region_state = region_state
	_region_state.changed.connect(_refresh)
	_refresh()


func _refresh() -> void:
	var combat_value: int = _region_state.get_total_combat_value()
	if combat_value == 0:
		_army_panel.hide()
	else:
		_army_panel.show()
		_combat_label.text = str(combat_value)
