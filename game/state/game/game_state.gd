class_name GameState
extends RefCounted


var map_state: MapState
var piece_pool: PiecePool
var reinforcements: Reinforcements = Reinforcements.new()
var casualties: Casualties = Casualties.new()
var political_state: PoliticalState
