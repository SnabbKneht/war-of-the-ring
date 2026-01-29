shader_type canvas_item;

uniform sampler2D id_map;
uniform sampler2D region_mask;
uniform vec4 stripes_color : source_color = vec4(0.0, 1.0, 0.0, 1.0);
uniform int stripe_width : hint_range(1, 100, 1);
uniform int gap_width : hint_range(1, 100, 1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	ivec2 pixel_pos = ivec2(UV * vec2(2254.0, 1547.0));
	int region_id = int(texelFetch(id_map, pixel_pos, 0).r * 255.0);
	ivec2 coord = ivec2(region_id - 1, 0);
	vec4 mask = texelFetch(region_mask, coord, 0);

	if(mask.r > 0.5 && (pixel_pos.x + pixel_pos.y) % (stripe_width + gap_width) < stripe_width) {
		COLOR = stripes_color;
	} else {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
