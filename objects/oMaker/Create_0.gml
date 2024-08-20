maze = oMaze
grid_size = oMaze.grid_size
grid_x = 0
grid_y = 0

directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]

trail_lifetime = -1

prev_rule_0_dir_index = -1

wander_limit = 600
wander_time = wander_limit

color = irandom(2) + 1
target_color = color % 3 + 1
targeting_color = (color + 1) % 3 + 1

dup_limit = 600
dup_count = 0