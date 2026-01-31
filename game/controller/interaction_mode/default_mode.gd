class_name DefaultMode
extends InteractionMode


signal advance_nation_requested(nation: Enums.Nation)
signal move_back_nation_requested(nation: Enums.Nation)


@onready var political_track_view: PoliticalTrackView = $HUD/PoliticalTrackView
@onready var region_details_view: RegionDetailsView = $HUD/RegionDetailsView


func _ready() -> void:
	political_track_view.advance_nation_requested.connect(advance_nation_requested.emit)
	political_track_view.move_back_nation_requested.connect(move_back_nation_requested.emit)
	region_details_view.neighbor_highlight_requested.connect(_on_neighbor_highlight_requested)
	region_details_view.neighbor_highlight_cancelled.connect(_on_neighbor_highlight_cancelled)


func enter(p_game_state: GameState, p_game_ui: GameUI) -> void:
	super(p_game_state, p_game_ui)
	political_track_view.set_game_state(_game_state)
	political_track_view.set_political_state(_game_state.political_state)
	_game_ui.region_hovered.connect(_on_region_hovered)
	_game_ui.region_selected.connect(_on_region_selected)
	_game_ui.region_deselected.connect(_on_region_deselected)


func exit() -> void:
	pass


func on_cancel() -> void:
	pass


func _on_neighbor_highlight_requested(region_id: int) -> void:
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.NEIGHBOR)
	_game_ui.add_region_overlay(GameData.get_neighbors(region_id), UIEnums.RegionOverlay.NEIGHBOR)


func _on_neighbor_highlight_cancelled(_region_id: int) -> void:
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.NEIGHBOR)


func _on_region_selected(region_id: int) -> void:
	_show_region_details(_game_state.map_state.get_region_state_by_id(region_id))
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.SELECTION)
	_game_ui.add_region_overlay([region_id], UIEnums.RegionOverlay.SELECTION)


func _on_region_deselected() -> void:
	_hide_region_details()
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.SELECTION)


func _on_region_hovered(region_id: int) -> void:
	_game_ui.clear_region_overlay(UIEnums.RegionOverlay.HIGHLIGHT)
	_game_ui.add_region_overlay([region_id], UIEnums.RegionOverlay.HIGHLIGHT)


func _show_region_details(region_state: RegionState) -> void:
	region_details_view.set_region_state(region_state)
	region_details_view.show()


func _hide_region_details() -> void:
	region_details_view.hide()
