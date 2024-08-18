var move_dir = pick_direction(self)

grid_x = clamp(grid_x + move_dir[0], 0, grid_size - 1)
grid_y = clamp(grid_y + move_dir[1], 0, grid_size - 1)
var decay_column = floor(grid_x * maze.decay.resolution / grid_size)
var interval_since_decay = maze.decay.step - decay_column
var should_wrap = interval_since_decay <= 0
if (should_wrap) {
	interval_since_decay += maze.decay.resolution
}

set_tunnel(maze, grid_x, grid_y, trail_lifetime + interval_since_decay)

if (get_color(maze, grid_x, grid_y) == 1) {
	set_color(maze, grid_x, grid_y, 0)
	
	var maker = instance_create_layer(x, y, "Instances", oMaker)
	maker.grid_x = grid_x
	maker.grid_y = grid_y
	maker.trail_lifetime = trail_lifetime
}