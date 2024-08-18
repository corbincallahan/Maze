function pick_direction(this){
	with(this) {
		// TODO Create new_positions, filtering out of bounds, and use below
		
		#region Food
		var food_dirs = []
		for (var i = 0; i < array_length(directions); i += 1) {
			var dir = directions[i]
			var new_x = grid_x + dir[0]
			var new_y = grid_y + dir[1]
			if (not is_in_bounds(new_x, new_y)) {
				continue
			}
			if (get_color(maze, new_x, new_y) == 1) {
				array_push(food_dirs, dir)
			}
		}
		if (array_length(food_dirs) > 0) {
			prev_rule_0_dir_index = -1 // TODO ?
			wander_time = wander_limit
			var food_index = irandom(array_length(food_dirs) - 1)
			return food_dirs[food_index]
		}
		#endregion
		
		#region Rule 1
		var rule_1_dirs = []
		for (var i = 0; i < array_length(directions); i += 1) {
			var dir = directions[i]
			var new_x = grid_x + dir[0]
			var new_y = grid_y + dir[1]
			if (not is_in_bounds(new_x, new_y)) {
				continue
			}
			if (get_tunnel(maze, new_x, new_y) == 0 and check_local(maze, new_x, new_y, 1, false) <= 1) {
				array_push(rule_1_dirs, dir)
			}
		}
		if (array_length(rule_1_dirs) > 0) {
			prev_rule_0_dir_index = -1 // TODO ?
			wander_time = wander_limit
			var rule_1_index = irandom(array_length(rule_1_dirs) - 1)
			return rule_1_dirs[rule_1_index]
		}
		#endregion
		
		#region Rule 0
		var rule_0_dir_indices = []
		for (var i = 0; i < array_length(directions); i += 1) {
			if (i == prev_rule_0_dir_index) {
				continue
			}
			var dir = directions[i]
			var new_x = grid_x + dir[0]
			var new_y = grid_y + dir[1]
			if (not is_in_bounds(new_x, new_y)) {
				continue
			}
			if (get_tunnel(maze, new_x, new_y) > 0) {
				array_push(rule_0_dir_indices, i)
			}
		}
	
		var index = -1
	
		if (array_length(rule_0_dir_indices) > 0) {
			var rule_0_index = irandom(array_length(rule_0_dir_indices) - 1)
			index = rule_0_dir_indices[rule_0_index]
		}
		else if (prev_rule_0_dir_index == -1) {
			index = irandom(array_length(directions))
		}
		else {
			index = prev_rule_0_dir_index
		}
		prev_rule_0_dir_index = (index + 2) % 4
		wander_time -= 1
		if (wander_time <= 0) {
			instance_destroy()
		}
		return directions[index]
		#endregion
	}
}