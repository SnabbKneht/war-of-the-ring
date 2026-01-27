class_name RegionHighlighOverlay
extends Sprite2D


@export var region_id_map: Image


func highlight(region_ids: Array[int]) -> void:
	var new_image: Image = Image.create_empty(105, 1, false, Image.FORMAT_R8)
	for i: int in range(105):
		if (i + 1) in region_ids:
			new_image.set_pixel(i, 0, Color.WHITE)
		else:
			new_image.set_pixel(i, 0, Color.BLACK)
	material.set_shader_parameter("region_mask", ImageTexture.create_from_image(new_image))
