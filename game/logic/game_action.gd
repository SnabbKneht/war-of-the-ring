@abstract
class_name GameAction
extends RefCounted


@abstract func can_apply(game_state: GameState) -> bool


@abstract func apply(game_state: GameState) -> void


@abstract func undo(game_state: GameState) -> void
