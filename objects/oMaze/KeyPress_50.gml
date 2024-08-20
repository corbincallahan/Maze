var grid_pos = loc_to_grid(mouse_x, mouse_y)
var maker = instance_create_layer(mouse_x, mouse_y, "Instances", oMaker)
maker.grid_x = grid_pos[0]
maker.grid_y = grid_pos[1]
maker.trail_lifetime = trail_lifetime
maker.color = 3
maker.target_color = (maker.color - 1) % 3 + 2