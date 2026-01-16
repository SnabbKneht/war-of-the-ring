class_name NationTrackView
extends HBoxContainer


@onready var icon_1: TextureRect = $Square1/NationIcon
@onready var icon_2: TextureRect = $Square2/NationIcon2
@onready var icon_3: TextureRect = $Square3/NationIcon3
@onready var icon_4: TextureRect = $Square4/NationIcon4


@export var nation: Enums.Nation
var _nation_state: NationState


func set_nation_state(nation_state: NationState) -> void:
	_nation_state = nation_state
	_nation_state.changed.connect(_refresh)
	_refresh()


func _refresh() -> void:
	_refresh_icon_textures()
	_refresh_icon_visibility()


func _get_texture() -> Texture2D:
	if _nation_state.is_active():
		return UIData.get_active_nation_icon(_nation_state.get_nation())
	else:
		return UIData.get_nation_icon(_nation_state.get_nation())


func _refresh_icon_textures() -> void:
	var texture: Texture2D = _get_texture()
	icon_1.texture = texture
	icon_2.texture = texture
	icon_3.texture = texture
	icon_4.texture = texture


func _refresh_icon_visibility() -> void:
	icon_1.hide()
	icon_2.hide()
	icon_3.hide()
	icon_4.hide()
	match _nation_state.get_step():
		1:
			icon_1.show()
		2:
			icon_2.show()
		3:
			icon_3.show()
		4:
			icon_4.show()
