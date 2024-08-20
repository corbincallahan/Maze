maze = oMaze
grid_size = oMaze.grid_size
grid_x = 0
grid_y = 0

directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]

trail_lifetime = -1

prev_rule_0_dir_index = -1

wander_limit = 1200
wander_time = wander_limit

color = irandom(2) + 2 // 2, 3, or 4