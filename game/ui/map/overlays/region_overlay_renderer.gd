class_name RegionOverlayRenderer
extends Node2D


@onready var highlight_overlay: RegionShaderOverlay = $HighlightOverlay
@onready var accessible_overlay: RegionShaderOverlay = $AccessibleOverlay
@onready var selection_overlay: RegionShaderOverlay = $SelectionOverlay
@onready var neighbor_overlay: RegionShaderOverlay = $NeighborOverlay


var _overlay_regions: Dictionary[UIEnums.RegionOverlay, Array] = {}


func _ready() -> void:
	for overlay: UIEnums.RegionOverlay in UIEnums.RegionOverlay.values():
		_overlay_regions[overlay] = ([] as Array[int])


func add_overlay(region_ids: Array[int], overlay: UIEnums.RegionOverlay) -> void:
	for region_id: int in region_ids:
		if not _overlay_regions[overlay].has(region_id):
			_overlay_regions[overlay].append(region_id)
	_refresh(overlay)


func remove_overlay(region_ids: Array[int], overlay: UIEnums.RegionOverlay) -> void:
	for region_id: int in region_ids:
		if _overlay_regions[overlay].has(region_id):
			_overlay_regions[overlay].erase(region_id)
	_refresh(overlay)


func clear_overlay(overlay: UIEnums.RegionOverlay) -> void:
	_overlay_regions[overlay].clear()
	_refresh(overlay)


func _refresh(overlay: UIEnums.RegionOverlay) -> void:
	var overlay_node: RegionShaderOverlay
	match overlay:
		UIEnums.RegionOverlay.HIGHLIGHT:
			overlay_node = highlight_overlay
		UIEnums.RegionOverlay.SELECTION:
			overlay_node = selection_overlay
		UIEnums.RegionOverlay.ACCESSIBLE:
			overlay_node = accessible_overlay
		UIEnums.RegionOverlay.NEIGHBOR:
			overlay_node = neighbor_overlay
		_:
			push_error("Unsupported overlay")
	
	if _overlay_regions[overlay].is_empty():
		overlay_node.disable()
	else:
		overlay_node.enable(_overlay_regions[overlay])
