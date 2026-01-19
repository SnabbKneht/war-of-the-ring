class_name PoliticalLogic
extends RefCounted


static func create_advance_nation_action(nation: Enums.Nation) -> AdvanceNationAction:
	return AdvanceNationAction.new(nation)


static func create_move_back_nation_action(nation: Enums.Nation) -> MoveBackNationAction:
	return MoveBackNationAction.new(nation)


static func can_advance_nation(game_state: GameState, nation: Enums.Nation) -> bool:
	return create_advance_nation_action(nation).can_apply(game_state)


static func can_move_back_nation(game_state: GameState, nation: Enums.Nation) -> bool:
	return create_move_back_nation_action(nation).can_apply(game_state)
