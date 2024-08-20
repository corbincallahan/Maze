varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int grid_size;
uniform int trail_lifetime;

uniform int decay_step;
uniform int decay_resolution;

uniform sampler2D tunnel_sampler;
uniform sampler2D color_sampler;

void main()
{	
	int tunnel_state = int(texture2D(tunnel_sampler, v_vTexcoord).r);
	int color = int(texture2D(color_sampler, v_vTexcoord).r);
	
	bool is_food = color == 1;
	vec4 food_color = vec4(0.3, 0.1, 0.0, 1.0) * float(is_food);
	
	int decay_column = int(floor(v_vTexcoord.x * float(decay_resolution)));
	int interval_since_decay = decay_step - decay_column;
	int should_wrap = int(interval_since_decay <= 0);
	interval_since_decay = interval_since_decay + decay_resolution * should_wrap;
	float tunnel_brightness = float(tunnel_state - interval_since_decay) / float(trail_lifetime);
	
	float red = float(color == 2);
	float green = float(color == 3);
	float blue = float(color == 4);
	
	vec4 tunnel_color = vec4(red, green, blue, 1.0) * float(!is_food) * tunnel_brightness;
	
	vec4 result_color = food_color + tunnel_color;
	
	// -------------- Gaussian blur ----------------------------
	
	//float TAU = 6.28318530718;
	//float directions = 8.0;
	//float quality = 1.0;
	//float size = 0.5;
	
	//vec2 radius = size / vec2(float(grid_size), float(grid_size));
	
	//for(float d = 0.0; d < TAU; d += TAU / directions) {
	//	for(float i = 1.0 / quality; i < 1.001; i += 1.0 / quality) {
	//		vec2 uv = v_vTexcoord + vec2(cos(d), sin(d)) * radius * i;
	//		int tunnel_state = int(texture2D(tunnel_sampler, uv).r);
	//		int color = int(texture2D(color_sampler, uv).r);
	
	//		bool is_food = color == 1;
	//		vec4 food_color = vec4(0.3, 0.1, 0.0, 1.0) * float(is_food);
	
	//		int decay_column = int(floor(uv.x * float(decay_resolution)));
	//		int interval_since_decay = decay_step - decay_column;
	//		int should_wrap = int(interval_since_decay <= 0);
	//		interval_since_decay = interval_since_decay + decay_resolution * should_wrap;
	//		float tunnel_brightness = float(tunnel_state - interval_since_decay) / float(trail_lifetime);
	
	//		vec4 tunnel_color = vec4(1.0, 1.0, 1.0, 1.0) * float(!is_food) * tunnel_brightness;
	
	//		result_color += food_color + tunnel_color;
	//	}
	//}
	
	//result_color /= quality * directions + 1.0;
	
	// ---------------------------------------------------------
	
    gl_FragColor = result_color;
}
