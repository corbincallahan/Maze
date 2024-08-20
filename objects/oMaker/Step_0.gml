var move_dir = pick_direction(self)

var prev_x = grid_x
var prev_y = grid_y

grid_x = clamp(grid_x + move_dir[0], 0, grid_size - 1)
grid_y = clamp(grid_y + move_dir[1], 0, grid_size - 1)
var decay_column = floor(grid_x * maze.decay.resolution / grid_size)
var interval_since_decay = maze.decay.step - decay_column
var should_wrap = interval_since_decay <= 0
if (should_wrap) {
	interval_since_decay += maze.decay.resolution
}

set_tunnel(maze, grid_x, grid_y, trail_lifetime + interval_since_decay)

var loc_color = get_color(maze, grid_x, grid_y)

if (loc_color == 1) {
	set_color(maze, grid_x, grid_y, 0)
	
	var maker = instance_create_layer(x, y, "Instances", oMaker)
	maker.grid_x = grid_x
	maker.grid_y = grid_y
	maker.trail_lifetime = trail_lifetime
	maker.color = color
	maker.target_color = target_color
}
else if (loc_color == target_color * 2 + 1) {
	for (var i = 0; i < instance_number(oMaker); i++) {
		var curr = instance_find(oMaker, i)
		if (curr.color == target_color and curr.grid_x == grid_x and curr.grid_y == grid_y) {
			instance_destroy(curr)
		}
	}
}

if (dup_count >= dup_limit) {
	dup_count = 0
	var maker = instance_create_layer(x, y, "Instances", oMaker)
	maker.grid_x = grid_x
	maker.grid_y = grid_y
	maker.trail_lifetime = trail_lifetime
	maker.color = color
	maker.target_color = target_color
}

set_color(maze, grid_x, grid_y, color * 2 + 1)
if(get_color(maze, prev_x, prev_y) == color * 2 + 1) {
	set_color(maze, prev_x, prev_y, color * 2)
}