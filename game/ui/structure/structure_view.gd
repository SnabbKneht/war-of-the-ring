class_name StructureView
extends Sprite2D


@export var stronghold_scale: float = 1.0
@export var city_scale: float = 1.0
@export var town_scale: float = 1.0


func display_settlement(side: Enums.Side, structure_type: Enums.RegionStructure) -> void:
	texture = UIData.get_settlement_icon(side, structure_type)
	match structure_type:
		Enums.RegionStructure.STRONGHOLD:
			scale = Vector2.ONE * stronghold_scale
		Enums.RegionStructure.CITY:
			scale = Vector2.ONE * city_scale
		Enums.RegionStructure.TOWN:
			scale = Vector2.ONE * town_scale


func display_fortification() -> void:
	texture = UIData.get_fortification_icon()
	scale = Vector2.ONE * city_scale
