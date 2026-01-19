class_name NationTrackView
extends HBoxContainer


signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var nation_icon: TextureRect = $NationIcon
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var war_label: Label = $ProgressBar/WarLabel


@export var nation: Enums.Nation
var _nation_state: NationState


func set_nation_state(nation_state: NationState) -> void:
	_nation_state = nation_state
	_nation_state.changed.connect(_refresh)
	_refresh()


func _refresh() -> void:
	_refresh_icon_texture()
	_refresh_progress_bar()
	_refresh_war_label()


func _refresh_icon_texture() -> void:
	if _nation_state.is_active():
		nation_icon.texture = UIData.get_active_nation_icon(_nation_state.get_nation())
	else:
		nation_icon.texture = UIData.get_nation_icon(_nation_state.get_nation())


func _refresh_progress_bar() -> void:
	progress_bar.value = _nation_state.get_step()


func _refresh_war_label() -> void:
	if _nation_state.is_at_war():
		war_label.show()
	else:
		war_label.hide()


func _on_advance_button_pressed() -> void:
	advance_nation_requested.emit(nation)


func _on_move_back_button_pressed() -> void:
	move_back_nation_requested.emit(nation)
