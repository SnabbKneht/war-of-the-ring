class_name GameController
extends Node


@export var default_mode_scene: PackedScene
@export var army_movement_mode_scene: PackedScene


@onready var game_ui: GameUI = $GameUI
var game_state: GameState
var _current_mode: InteractionMode


func _ready() -> void:
	game_state = GameStateFactory.create()
	game_ui.set_game_state(game_state)
	_switch_to_default_mode()


func _on_advance_nation_requested(nation: Enums.Nation) -> void:
	var action: GameAction = PoliticalLogic.create_advance_nation_action(nation)
	if action.can_apply(game_state):
		action.apply(game_state)
		# Add action to history


func _on_move_back_nation_requested(nation: Enums.Nation) -> void:
	var action: GameAction = PoliticalLogic.create_move_back_nation_action(nation)
	if action.can_apply(game_state):
		action.apply(game_state)
		# Add action to history


func _on_army_movement_requested(piece_ids: Array[StringName], from_region_id: int, to_region_id: int) -> void:
	print("Army movement requested.")
	_switch_to_default_mode()


func _on_army_movement_mode_requested(piece_ids: Array[StringName], from_region_id: int) -> void:
	_switch_to_army_movement_mode(piece_ids, from_region_id)


func _switch_to_default_mode() -> void:
	var mode_scene: Node = default_mode_scene.instantiate()
	(mode_scene as DefaultMode).configure(game_state, game_ui)
	add_child(mode_scene)
	_current_mode = mode_scene as DefaultMode
	_current_mode.advance_nation_requested.connect(_on_advance_nation_requested)
	_current_mode.move_back_nation_requested.connect(_on_move_back_nation_requested)
	_current_mode.army_movement_mode_requested.connect(_on_army_movement_mode_requested)


func _switch_to_army_movement_mode(piece_ids: Array[StringName], from_region_id) -> void:
	_current_mode.queue_free()
	var mode_scene: Node = army_movement_mode_scene.instantiate()
	(mode_scene as ArmyMovementMode).configure(game_state, game_ui, piece_ids, from_region_id)
	add_child(mode_scene)
	_current_mode = mode_scene as ArmyMovementMode
	_current_mode.army_movement_requested.connect(_on_army_movement_requested)
