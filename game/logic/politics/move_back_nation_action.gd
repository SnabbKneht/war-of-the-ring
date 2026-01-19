class_name MoveBackNationAction
extends GameAction


var _nation: Enums.Nation


func _init(p_nation: Enums.Nation) -> void:
	_nation = p_nation


func can_apply(game_state: GameState) -> bool:
	return game_state.political_state.get_nation_step(_nation) > 1


func apply(game_state: GameState) -> void:
	game_state.political_state.move_back_nation(_nation)


func undo(game_state: GameState) -> void:
	game_state.political_state.advance_nation(_nation)
