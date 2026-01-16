class_name PoliticalStateFactory
extends RefCounted


static func create() -> PoliticalState:
	var political_state: PoliticalState = PoliticalState.new()
	for setup: NationInitialSetup in GameData.get_all_nation_initial_setups():
		var nation_state: NationState = NationState.new(setup.nation, setup.political_step, setup.is_active)
		political_state._nation_to_state[setup.nation] = nation_state
	return political_state
