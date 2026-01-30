shader_type canvas_item;

uniform sampler2D nation_id_map;

group_uniforms NationColors;
uniform vec4 dwarves_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 elves_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 north_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 rohan_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 gondor_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 isengard_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 sauron_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 easterlings_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	ivec2 pixel_pos = ivec2(UV * vec2(2254.0, 1547.0));
	int nation_id = int(texelFetch(nation_id_map, pixel_pos, 0).r * 255.0);

	switch(nation_id) {
		case 1: // Dwarves
			COLOR = dwarves_color;
			break;
		case 2: // Elves
			COLOR = elves_color;
			break;
		case 3: // North
			COLOR = north_color;
			break;
		case 4: // Rohan
			COLOR = rohan_color;
			break;
		case 5: // Gondor
			COLOR = gondor_color;
			break;
		case 6: // Isengard
			COLOR = isengard_color;
			break;
		case 7: // Sauron
			COLOR = sauron_color;
			break;
		case 8: // Easterlings
			COLOR = easterlings_color;
			break;
		default:
			COLOR = vec4(0.0, 0.0, 0.0, 0.0);
			break;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
