class_name PoliticalTrackView
extends FoldableContainer


@onready var nation_tracks: VBoxContainer = $NationTracks


var _political_state: PoliticalState
var _nation_views: Dictionary[Enums.Nation, NationTrackView] = {}


func set_political_state(political_state: PoliticalState) -> void:
	_political_state = political_state
	_init_nation_views()


func _init_nation_views() -> void:
	for nation_view: NationTrackView in nation_tracks.get_children():
		nation_view.set_nation_state(_political_state.get_nation_state(nation_view.nation))
		_nation_views[nation_view.nation] = nation_view
