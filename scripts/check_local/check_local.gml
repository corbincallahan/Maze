function check_local(maze, x, y, distance, diagonal){
	// TODO consider points other than cardinal directions? diagonals?
	var directions = [[distance, 0], [0, distance], [-distance, 0], [0, -distance]]
	if(diagonal) {
		array_push(directions, [distance, distance], [distance, -distance], [-distance, distance], [-distance, -distance])
	}
	var ret = 0
	for (var i = 0; i < array_length(directions); i += 1) {
		var new_x = x + directions[i][0]
		var new_y = y + directions[i][1]
		if (not is_in_bounds(new_x, new_y)) {
			continue
		}
		if (get_tunnel(maze, new_x, new_y) > 0) {
			ret += 1
		}
	}
	return ret
}