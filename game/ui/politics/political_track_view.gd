class_name PoliticalTrackView
extends FoldableContainer


signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var nation_tracks: VBoxContainer = $NationTracks


var _game_state: GameState
var _political_state: PoliticalState
var _nation_views: Dictionary[Enums.Nation, NationTrackView] = {}


func set_game_state(game_state: GameState) -> void:
	_game_state = game_state


func set_political_state(political_state: PoliticalState) -> void:
	_political_state = political_state
	_init_nation_views()


func _init_nation_views() -> void:
	for nation_view: NationTrackView in nation_tracks.get_children():
		nation_view.set_game_state(_game_state)
		nation_view.set_nation_state(_political_state.get_nation_state(nation_view.nation))
		_nation_views[nation_view.nation] = nation_view
		nation_view.advance_nation_requested.connect(func(nation: Enums.Nation) -> void: advance_nation_requested.emit(nation))
		nation_view.move_back_nation_requested.connect(func(nation: Enums.Nation) -> void: move_back_nation_requested.emit(nation))
