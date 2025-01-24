shader_type canvas_item;
uniform sampler2D text;
uniform sampler2D background;
uniform sampler2D cliff;
uniform int y_offset=0;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(text,fract(UV-vec2(0.0,SCREEN_PIXEL_SIZE.y*float(y_offset))));
	if(COLOR.r>0.5){
		COLOR = texture(cliff,SCREEN_UV);
	} else{
		COLOR = texture(background,SCREEN_UV);
	}
	//COLOR*=vec4(0.5 + 0.5*cos(TIME+UV.xyx+vec3(0,2,4)),1.0);
	//COLOR=texture(text,UV);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
