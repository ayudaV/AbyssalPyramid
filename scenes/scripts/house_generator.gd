extends Node

class_name House

var wood_beam = preload("res://scenes/house_structs/wood_beam.tscn")
var corner_wood_beam = preload("res://scenes/house_structs/coner_wood_beam.tscn")
var house_floor = preload("res://scenes/house_structs/house_floor.tscn")
var house_wall = preload("res://scenes/house_structs/house_wall.tscn")
var simple_door = preload("res://scenes/house_structs/simple_door.tscn")
var conect_house_wall_wood_beam = preload("res://scenes/house_structs/conect_house_wall_wood_beam.tscn")
var conect_house_wall_2_wood_beam = preload("res://scenes/house_structs/conect_house_wall_2_wood_beam.tscn")

var rng = RandomNumberGenerator.new()
var seed:int
var house_map:Array
const max_size = 10
const max_height = 5
var size_x:int
var size_y:int
var size_z:int
var garden_space:int


func set_main_door(main_door_face:int, n_module_x:int, n_module_z:int):
	match main_door_face:
		0: house_map[size_z-1][(seed % n_module_x) * 2 + 1][0] = {"type":"simple_door", "direction":main_door_face}
		1: house_map[(seed % n_module_z) * 2 + 1][0][0] = {"type":"simple_door", "direction":main_door_face}
		2: house_map[0][(seed % n_module_x) * 2 + 1][0] = {"type":"simple_door", "direction":main_door_face}
		3: house_map[(seed % n_module_z) * 2 + 1][size_x - 1][0] = {"type":"simple_door", "direction":main_door_face}
		
func set_garden(garden_direction:int, n_module_x:int, n_module_z:int):
	match garden_direction:
		0: pass
		
		
func _init(n_modules_x:int, n_modules_z:int, n_modules_y:int=1, seed:int=rng.randi_range(100000, 999999), main_door_dir:int=seed%4):
	seed = seed
	size_x = n_modules_x * 2 + 1
	size_z = n_modules_z * 2 + 1
	size_y = n_modules_y + 1
	house_map = []
	for z in range(size_z):
		house_map.append([])
		for x in range(size_x):
			house_map[z].append([])
			for y in range(size_y):
				if z % 2 == 0 and x % 2 == 0:
					if (z == 0 or z == size_z-1) and (x == 0 or x == size_x-1):
						house_map[z][x].append({"type":"corner_wood_beam", "direction":0})
					else:
						house_map[z][x].append({"type":"wood_beam", "direction":0})
				elif z % 2 == 0 and x % 2 == 1:
					house_map[z][x].append({"type":"conect_house_wall_2_wood_beam", "direction":0})
				elif z % 2 == 1 and x % 2 == 0:
					house_map[z][x].append({"type":"conect_house_wall_2_wood_beam", "direction":1})
				elif y == 0:
					house_map[z][x].append({"type":"floor", "direction":0})
				else:
					house_map[z][x].append({"type":"air", "direction":0})
func structs_instantiate(struct:Dictionary) -> Node3D:
	match struct.type:
		"house_floor": return house_floor.instantiate()
		"simple_door": return simple_door.instantiate()
		"wood_beam": return wood_beam.instantiate()
		"corner_wood_beam": return corner_wood_beam.instantiate()
		"house_wall": return house_wall.instantiate()
		"conect_house_wall_wood_beam": return conect_house_wall_wood_beam.instantiate()
		"conect_house_wall_2_wood_beam": return conect_house_wall_2_wood_beam.instantiate()
	return null
	 
	
func load_house(house_node: Node3D):
	for z in range(size_z):
		for x in range(size_x):
			for y in range(size_y):
				var struct_node = structs_instantiate(house_map[z][x][y])
				if struct_node:
					struct_node.rotate_y(house_map[z][x][y]["direction"] * PI/2)
					struct_node.transform.origin = Vector3(x, y*3, z)
					house_node.add_child(struct_node)


