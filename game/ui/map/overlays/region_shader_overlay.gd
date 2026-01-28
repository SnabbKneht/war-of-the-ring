class_name RegionShaderOverlay
extends Sprite2D


func enable(region_ids: Array[int]) -> void:
	var region_mask: ImageTexture = RegionMaskGenerator.generate_mask(region_ids)
	material.set_shader_parameter("region_mask", region_mask)
	show()


func disable() -> void:
	hide()
