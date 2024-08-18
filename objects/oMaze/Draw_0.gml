buffer_set_surface(tunnel_buffer, tunnel_surface, 0)
buffer_set_surface(color_buffer, color_surface, 0)

shader_set(shMaze)
shader_set_uniform_i(uniform_grid_size, grid_size)
shader_set_uniform_i(uniform_trail_lifetime, trail_lifetime)
shader_set_uniform_i(uniform_decay_step, decay.step)
shader_set_uniform_i(uniform_decay_resolution, decay.resolution)
texture_set_stage(tunnel_sampler, surface_get_texture(tunnel_surface))
texture_set_stage(color_sampler, surface_get_texture(color_surface))
draw_self()
shader_reset()

//for (var i = 0; i < grid_size; i += 1) {
//	for (var j = 0; j < grid_size; j += 1) {
//		if (grid[i][j].color == 1) {
//			var loc = grid_to_loc(i, j)
//			var color = make_color_hsv(20, 90, 80)
//			draw_rectangle_color(loc[0] - cell_width / 2, loc[1] - cell_height / 2, loc[0] + cell_width / 2, loc[1] + cell_height / 2, color, color, color, color, false)
//			continue
//		}
//		if (grid[i][j].tunnel_state > 0) {
//			var loc = grid_to_loc(i, j)
//			var color = make_color_hsv(0, 0, 255 * grid[i][j].tunnel_state / trail_lifetime)
//			draw_rectangle_color(loc[0] - cell_width / 2, loc[1] - cell_height / 2, loc[0] + cell_width / 2, loc[1] + cell_height / 2, color, color, color, color, false)
//			grid[i][j].tunnel_state -= 1
//		}
//	}
//}