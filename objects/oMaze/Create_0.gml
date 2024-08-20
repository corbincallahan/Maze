grid_size = 1200
trail_lifetime = 2400

decay = instance_create_layer(0, 0, "Instances", oDecay)

uniform_grid_size = shader_get_uniform(shMaze, "grid_size")
uniform_trail_lifetime = shader_get_uniform(shMaze, "trail_lifetime")

uniform_decay_step = shader_get_uniform(shMaze, "decay_step")
uniform_decay_resolution = shader_get_uniform(shMaze, "decay_resolution")

tunnel_buffer = buffer_create(2 * grid_size * grid_size, buffer_fixed, 2) // TODO remove first 2?
color_buffer = buffer_create(2 * grid_size * grid_size, buffer_fixed, 2)

tunnel_surface = surface_create(grid_size, grid_size, surface_r16float)
color_surface = surface_create(grid_size, grid_size, surface_r16float)

tunnel_sampler = shader_get_sampler_index(shMaze, "tunnel_sampler")
color_sampler = shader_get_sampler_index(shMaze, "color_sampler")

cell_width = room_width / grid_size
cell_height = room_height / grid_size

image_xscale = room_width / sprite_get_width(sprite_index)
image_yscale = room_height / sprite_get_height(sprite_index)

alarm_set(0, 1)