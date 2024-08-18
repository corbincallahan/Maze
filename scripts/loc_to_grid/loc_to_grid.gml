function loc_to_grid(x, y){
	var grid_size = oMaze.grid_size
	var ret_x = int64(grid_size * x / room_width)
	var ret_y = int64(grid_size * y / room_height)
	return [ret_x, ret_y]
}