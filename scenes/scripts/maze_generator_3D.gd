extends Object

class_name Maze3D
var wall_scene = preload("res://scenes/maze_wall.tscn")
var floor_scene = preload("res://scenes/maze_floor.tscn")

var size:int
var entrance_x:int
var entrance_y:int
var entrance_z:int
var maze:Array

func _init(n:int, x:int, y:int, z:int):
	size = n * 2 + 1
	if x > 0 and x < n and y > 0 and y < n and z > 0 and z < n:
		entrance_x = x * 2 + 1
		entrance_y = y * 2 + 1
		entrance_z = z * 2 + 1
		maze = []
		for i in range(size):
			maze.append([])
			for j in range(size):
				maze[i].append([])
				for k in range(size):
					maze[i][j].append(1)
		maze[entrance_z][entrance_x][entrance_y] = 0
		gen_path_3D(maze, size, entrance_x, entrance_y, entrance_z)

func gen_path_3D(maze:Array, size:int, x:int, y:int, z:int):
	var directions = [0, 1, 2, 3, 4, 5]
	directions.shuffle()
	for direction in directions:
		match direction:
			0:
				if z - 2 > 0:
					if maze[z-2][x][y] != 0:
						maze[z-1][x][y] = 0
						maze[z-2][x][y] = 0
						gen_path_3D(maze, size, x, y, z-2)
			1:
				if x + 2 < size:
					if maze[z][x+2][y] != 0:
						maze[z][x+1][y] = 0
						maze[z][x+2][y] = 0
						gen_path_3D(maze, size, x+2, y, z)
			2:
				if z + 2 < size:
					if maze[z+2][x][y] != 0:
						maze[z+1][x][y] = 0
						maze[z+2][x][y] = 0
						gen_path_3D(maze, size, x, y, z+2)
			3:
				if x - 2 > 0:
					if maze[z][x-2][y] != 0:
						maze[z][x-1][y] = 0
						maze[z][x-2][y] = 0
						gen_path_3D(maze, size, x-2, y, z)
			4:
				if y + 2 < size:
					if maze[z][x][y+2] != 0:
						maze[z][x][y+1] = 0
						maze[z][x][y+2] = 0
						gen_path_3D(maze, size, x, y+2, z)
			5:
				if y - 2 > 0:
					if maze[z][x][y-2] != 0:
						maze[z][x][y-1] = 0
						maze[z][x][y-2] = 0
						gen_path_3D(maze, size, x, y-2, z)

func load_maze(maze_node: Node3D):
	for i in range(maze.size()):
		for j in range(maze.size()):
			for k in range(maze.size()):
				if maze[i][j][k] == 1:
					var wall_node = wall_scene.instantiate()
					wall_node.transform.origin = Vector3(j, k*2, i)
					maze_node.add_child(wall_node)
				elif k == 0 or maze[i][j][k-1] == 1:
					var floor_node = floor_scene.instantiate()
					floor_node.transform.origin = Vector3(j, k*2, i)
					maze_node.add_child(floor_node)

func set_player_at_entrance(player_node: CharacterBody3D):
	player_node.transform.origin = Vector3(entrance_x, entrance_y*2+0.1, entrance_z)
