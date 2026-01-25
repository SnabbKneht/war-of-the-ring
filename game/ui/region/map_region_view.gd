class_name MapRegionView
extends Node2D


@onready var structure_view: StructureView = $StructureView


@export var region_id: int = 0
var _region_state: RegionState


func set_region_state(region_state: RegionState) -> void:
	_region_state = region_state
	_region_state.changed.connect(_refresh)
	_refresh()


func _refresh() -> void:
	_refresh_structure_view()


func _refresh_structure_view() -> void:
	if _region_state.region_data.structure == Enums.RegionStructure.NONE:
		structure_view.hide()
	elif _region_state.region_data.structure == Enums.RegionStructure.FORTIFICATION:
		structure_view.display_fortification()
		structure_view.show()
	else:
		structure_view.display_settlement(_region_state.get_controlling_side(), _region_state.region_data.structure)
		structure_view.show()
