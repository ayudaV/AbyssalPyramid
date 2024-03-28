extends Object

class_name Maze2D
var wall_scene = preload("res://scenes/maze_wall.tscn")
var floor_scene = preload("res://scenes/maze_floor.tscn")

var size:int
var entrance_x:int
var entrance_z:int
var maze:Array
func _init(n:int, x:int, z:int):
	size = n * 2 + 1
	if x > 0 and x < n and z > 0 and z < n:
		entrance_x = x * 2 + 1
		entrance_z = z * 2 + 1
		maze = []
		for i in range(size):
			maze.append([])
			for j in range(size):
				maze[i].append(1)
		maze[entrance_z][entrance_x] = 0
		gen_path_2D(maze, size, entrance_x, entrance_z)

func gen_path_2D(maze:Array, size:int, x:int, z:int):
	var directions = [0, 1, 2, 3]
	directions.shuffle()
	for direction in directions:
		match direction:
			0:
				if z - 2 > 0:
					if maze[z-2][x] != 0:
						maze[z-1][x] = 0
						maze[z-2][x] = 0
						gen_path_2D(maze, size, x, z-2)
			1:
				if x + 2 < size:
					if maze[z][x+2] != 0:
						maze[z][x+1] = 0
						maze[z][x+2] = 0
						gen_path_2D(maze, size, x+2, z)
			2:
				if z + 2 < size:
					if maze[z+2][x] != 0:
						maze[z+1][x] = 0
						maze[z+2][x] = 0
						gen_path_2D(maze, size, x, z+2)
			3:
				if x - 2 > 0:
					if maze[z][x-2] != 0:
						maze[z][x-1] = 0
						maze[z][x-2] = 0
						gen_path_2D(maze, size, x-2, z)

func load_maze(maze_node: Node3D):
	for i in range(maze.size()):
		print(maze[i])
		for j in range(maze.size()):
			if maze[i][j] == 1:
				var wall_node = wall_scene.instantiate()
				wall_node.transform.origin = Vector3(j, 0, i)
				maze_node.add_child(wall_node)
			else:
				var floor_node = floor_scene.instantiate()
				floor_node.transform.origin = Vector3(j, 0, i)
				maze_node.add_child(floor_node)

func set_player_at_entrance(player_node: CharacterBody3D):
	player_node.transform.origin = Vector3(entrance_x, 0.1, entrance_z)
