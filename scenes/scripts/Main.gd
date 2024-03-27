extends Node3D

@onready var wall_scene = preload("res://scenes/wall.tscn")
@onready var floor_scene = preload("res://scenes/floor.tscn")
var maze_size = 20
var entrance_x = 2
var entrance_y = 2
	
func gen_path(maze:Array, size:int, x:int, y:int):
	var directions = [0, 1, 2, 3]
	directions.shuffle()
	for direction in directions:
		match direction:
			0:
				if y - 2 > 0:
					if maze[y-2][x] != 0:
						maze[y-1][x] = 0
						maze[y-2][x] = 0
						gen_path(maze, size, x, y-2)
			1:
				if x + 2 < size:
					if maze[y][x+2] != 0:
						maze[y][x+1] = 0
						maze[y][x+2] = 0
						gen_path(maze, size, x+2, y)
			2:
				if y + 2 < size:
					if maze[y+2][x] != 0:
						maze[y+1][x] = 0
						maze[y+2][x] = 0
						gen_path(maze, size, x, y+2)
			3:
				if x - 2 > 0:
					if maze[y][x-2] != 0:
						maze[y][x-1] = 0
						maze[y][x-2] = 0
						gen_path(maze, size, x-2, y)
	
func gen_maze(n:int, entrance_x:int, entrance_y:int):
	var size = n*2+1
	var maze = []
	for i in range(size):
		maze.append([])
		for j in range(size):
			maze[i].append(1)

	if entrance_x > 0 and entrance_x < n and entrance_y > 0 and entrance_y < n:
		var start_x = entrance_x * 2 + 1
		var start_y = entrance_y * 2 + 1
		maze[start_y][start_x] = 0
		gen_path(maze, size, start_x, start_y)
		
	return(maze)
# Called when the node enters the scene tree for the first time.
func _ready():
	var maze = gen_maze(maze_size, entrance_x, entrance_y)
	var maze_node = get_node("Maze")
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
	
	var player_node = get_node("Player")
	player_node.transform.origin = Vector3(entrance_x*2+1, 1, entrance_y*2+1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
