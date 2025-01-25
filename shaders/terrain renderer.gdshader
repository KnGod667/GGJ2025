shader_type canvas_item;
uniform sampler2D text;
uniform sampler2D background;
uniform sampler2D cliff;
uniform int text_y_resolution;
uniform int y_offset=0;
uniform int resolution_offset = 0;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	float text_y_res = 1.0/float(text_y_resolution);
	float off = float(resolution_offset)*text_y_res;
	uv.y*=(1.0-off);
	uv.y += off;
	uv.y = fract(uv.y-float(y_offset)*text_y_res);
	COLOR = texture(text,uv);
	if(COLOR.r>0.5){
		COLOR = texture(cliff,SCREEN_UV);
	} else{
		COLOR = texture(background,SCREEN_UV);
	}
	//COLOR = vec4(uv,0,1);
	//COLOR*=vec4(0.5 + 0.5*cos(TIME+UV.xyx+vec3(0,2,4)),1.0);
	//COLOR=texture(text,UV);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
