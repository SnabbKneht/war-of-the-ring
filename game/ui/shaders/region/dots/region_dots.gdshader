shader_type canvas_item;

uniform sampler2D id_map;
uniform sampler2D region_mask;
uniform vec4 dot_color : source_color = vec4(0.0, 1.0, 0.0, 1.0);
uniform int dot_size : hint_range(2, 10, 1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	ivec2 pixel_pos = ivec2(UV * vec2(2254.0, 1547.0));
	int region_id = int(texelFetch(id_map, pixel_pos, 0).r * 255.0);
	ivec2 coord = ivec2(region_id - 1, 0);
	vec4 mask = texelFetch(region_mask, coord, 0);

	if(mask.r > 0.5 && pixel_pos.x % (dot_size * 2) > dot_size && pixel_pos.y % (dot_size * 2) > dot_size) {
		COLOR = vec4(0.0, 1.0, 0.0, 1.0);
	} else {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
