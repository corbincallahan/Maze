function grid_to_loc(x, y){
	var grid_size = oMaze.grid_size
	var ret_x = (room_width * x / grid_size) + oMaze.cell_width / 2
	var ret_y = (room_height * y / grid_size) + oMaze.cell_height / 2
	return [ret_x, ret_y]
}