class_name NationTrackView
extends PanelContainer


signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var nation_icon: TextureRect = $HBoxContainer/PanelContainer/NationIcon
@onready var progress_bar: ProgressBar = $HBoxContainer/PanelContainer2/ProgressBar
@onready var war_label: Label = $HBoxContainer/PanelContainer2/ProgressBar/WarLabel
@onready var move_back_button: Button = $HBoxContainer/MoveBackButton
@onready var advance_button: Button = $HBoxContainer/AdvanceButton


@export var nation: Enums.Nation
var _nation_state: NationState
var _game_state: GameState


func set_nation_state(nation_state: NationState) -> void:
	_nation_state = nation_state
	_nation_state.changed.connect(_refresh)
	_refresh()


func set_game_state(game_state: GameState) -> void:
	_game_state = game_state


func _refresh() -> void:
	_refresh_icon_texture()
	_refresh_progress_bar()
	_refresh_war_label()
	
	_refresh_button_availability()


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


func _refresh_button_availability() -> void:
	advance_button.disabled = not PoliticalLogic.can_advance_nation(_game_state, nation)
	move_back_button.disabled = not PoliticalLogic.can_move_back_nation(_game_state, nation)


func _on_advance_button_pressed() -> void:
	advance_nation_requested.emit(nation)


func _on_move_back_button_pressed() -> void:
	move_back_nation_requested.emit(nation)
