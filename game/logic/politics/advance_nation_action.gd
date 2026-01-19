class_name AdvanceNationAction
extends GameAction


var _nation: Enums.Nation


func _init(p_nation: Enums.Nation) -> void:
	_nation = p_nation


func can_apply(game_state: GameState) -> bool:
	var nation_step: int = game_state.political_state.get_nation_step(_nation)
	if nation_step == 1 or nation_step == 2:
		return true
	elif nation_step == 3 and game_state.political_state.is_nation_active(_nation):
		return true
	else:
		return false


func apply(game_state: GameState) -> void:
	game_state.political_state.advance_nation(_nation)


func undo(game_state: GameState) -> void:
	game_state.political_state.move_back_nation(_nation)
