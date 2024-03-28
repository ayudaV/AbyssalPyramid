extends Node3D

@onready var Maze2D = preload("res://scenes/scripts/maze_generator_2D.gd")
@onready var Maze3D = preload("res://scenes/scripts/maze_generator_3D.gd")

var maze_size = 10
var entrance_x = 2
var entrance_y = 2
var entrance_z = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var maze2D = Maze2D.new(maze_size, entrance_x, entrance_z)
	maze2D.load_maze(get_node("Maze"))
	maze2D.set_player_at_entrance(get_node("Player"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
