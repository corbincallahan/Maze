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
	
	vec4 tunnel_color = vec4(1.0, 1.0, 1.0, 1.0) * float(!is_food) * tunnel_brightness;
	
	vec4 result_color = food_color + tunnel_color;
	
	//vec4 result_color = vec4(1.0, 0.0, 0.0, 1.0) * v_vTexcoord.x + vec4(0.0, 0.0, 1.0, 1.0) * v_vTexcoord.y;
	
    gl_FragColor = result_color;
}
