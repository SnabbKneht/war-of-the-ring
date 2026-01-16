# autoload UIData
extends Node


const UI_DATA_PATH: String = "res://game/ui/data/ui_data_resource.tres"


var _data: UIDataResource = preload(UI_DATA_PATH)


var _color_to_region_dictionary: Dictionary[Color, int] = {}


func _init() -> void:
	_init_color_to_region_dictionary()


func get_free_peoples_theme() -> Theme:
	return _data.free_peoples_theme


func get_shadow_theme() -> Theme:
	return _data.shadow_theme


func get_all_region_colors() -> Array[Color]:
	return _color_to_region_dictionary.keys()


func get_region_id_by_color(color: Color) -> int:
	assert(color in _color_to_region_dictionary.keys())
	return _color_to_region_dictionary[color]


func get_nation_icon(nation: Enums.Nation) -> Texture2D:
	assert(nation in _data.nation_icons.nation_to_icon.keys())
	return _data.nation_icons.nation_to_icon[nation]


func get_active_nation_icon(nation: Enums.Nation) -> Texture2D:
	assert(nation in _data.active_nation_icons.nation_to_icon.keys())
	return _data.active_nation_icons.nation_to_icon[nation]


func _init_color_to_region_dictionary() -> void:
	for entry: ColorToRegionEntry in _data.color_to_region_resource.color_to_region:
		_color_to_region_dictionary[entry.color] = entry.region_id
