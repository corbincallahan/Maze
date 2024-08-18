if (active) {
	var start_row = floor(step * step_size)
	var end_row = floor((step + 1) * step_size)

	for (var i = start_row; i < end_row; i += 1) {
		for (var j = 0; j < maze.grid_size; j += 1) {
			var val = get_tunnel(maze, i, j)
			set_tunnel(maze, i, j, max(val - resolution, 0))
		}
	}

	step = (step + 1) % resolution
}