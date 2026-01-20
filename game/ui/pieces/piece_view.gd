class_name PieceView
extends PanelContainer


@onready var free_pieces: ItemList = $HBoxContainer/FreePieces
@onready var shadow_pieces: ItemList = $HBoxContainer/ShadowPieces


var _pieces: Array[Piece]
