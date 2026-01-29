shader_type canvas_item;

uniform sampler2D id_map;
uniform sampler2D region_mask;
uniform vec4 border_color : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform int border_thickness : hint_range(1, 10, 1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	ivec2 pixel_pos = ivec2(UV * vec2(2254.0, 1547.0));
	int region_id = int(texelFetch(id_map, pixel_pos, 0).r * 255.0);
	ivec2 coord = ivec2(region_id - 1, 0);
	vec4 mask = texelFetch(region_mask, coord, 0);

	if(mask.r > 0.5) {
		bool is_border = false;
		for(int i = -border_thickness; i <= border_thickness; i++) {
			for(int j = -border_thickness; j <= border_thickness; j++) {
				ivec2 neighbor_pos = clamp(pixel_pos + ivec2(i, j), ivec2(0), textureSize(id_map, 0));
				int neighbor_id = int(texelFetch(id_map, neighbor_pos, 0).r * 255.0);
				if(neighbor_id != region_id) {
					is_border = true;
				}
			}
		}
		
		if(is_border) {
			COLOR = border_color * vec4(1.0, 1.0, 1.0, sin(TIME * 5.0) * 0.5 + 0.5);
		} else {
			COLOR = vec4(0.0, 0.0, 0.0, 0.0);
		}
	} else {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
