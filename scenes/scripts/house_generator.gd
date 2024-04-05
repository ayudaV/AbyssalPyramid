extends Node

class_name House

var house_shapes = [{"size_x":3, "size_z":2, "size_y":2, "shapes":[{"name":"corner_garden",  "map":[[[1, -1],[1, -1],[1, -1]],[[0, 0],[2, -1],[0, 0]]]},
																   {"name":"right_garden",   "map":[[[1, -1],[1, -1],[1, -1]],[[2, -1],[0, 0],[0, 0]]]}, 
																   {"name":"left_garden",    "map":[[[1, -1],[1, -1],[1, -1]],[[0, 0],[0, 0],[2, -1]]]},
																   {"name":"mid_garden",     "map":[[[1, -1],[2, -1],[1, -1]],[[1, -1],[0, 0],[1, -1]]]}]},
					{"size_x":2, "size_z":3, "size_y":2, "shapes":[{"name":"right_garden",   "map":[[[1],[1]],[[1],[1]],[[2],[0]]]},
																   {"name":"left_garden",    "map":[[[1],[1]],[[1],[1]],[[0],[2]]]},
																   {"name":"square_left",    "map":[[[1],[1]],[[1],[1]],[[1],[1]]]},
																   {"name":"square_right",   "map":[[[1],[1]],[[1],[1]],[[1],[2]]]}]},
					{"size_x":3, "size_z":3, "size_y":2, "shapes":[{"name":"corner_garden",  "map":[[[1, -3],[1, -3],[1, -3]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[0, 0],[2, -6],[0, 0]]]},
																   {"name":"left_garden_2",  "map":[[[0, 0],[0, 0],[1, -6]],
																									[[1, -5],[1, -5],[1, -6]],
																									[[0, 0],[0, 0],[2, -6]]]},
																   {"name":"right_garden_2", "map":[[[1, -6],[0, 0],[0, 0]],
																									[[1, -6],[1, -5],[1, -5]],
																									[[2, -6],[0, 0],[0, 0]]]},
																   {"name":"right_garden",   "map":[[[1, -3],[1, -3],[1, -3]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[2, -6],[0, 0],[0, 0]]]},
																   {"name":"right_garden_3", "map":[[[1, -4],[1, -2],[1, -3]],
																									[[1, -4],[1, -2],[1, -1]],
																									[[2, -4],[1, -2],[0, 0]]]},
																   {"name":"right_garden_4", "map":[[[1, -4],[1, -2],[0, 0]],
																									[[1, -4],[1, -2],[1, -3]],
																									[[2, -4],[1, -2],[1, -1]]]},
																   {"name":"left_garden",    "map":[[[1, -3],[1, -3],[1, -3]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[0, 0],[0, 0],[2, -6]]]},
																   {"name":"left_garden_3",  "map":[[[1, -3],[1, -4],[1, -2]],
																									[[1, -1],[1, -4],[1, -2]],
																									[[0, 0],[1, -4],[2, -2]]]},
																   {"name":"left_garden_4",  "map":[[[0, 0],[1, -4],[1, -2]],
																									[[1, -3],[1, -4],[1, -2]],
																									[[1, -1],[1, -4],[2, -2]]]},
																   {"name":"mid_garden_2",   "map":[[[1, -5],[2, -5],[1, -5]],
																									[[1, -6],[0, 0],[1, -6]],
																									[[1, -6],[0, 0],[1, -6]]]},
																   {"name":"mid_garden",     "map":[[[1, -3],[1, -3],[1, -3]],
																									[[1, -1],[2, -1],[1, -1]],
																									[[1, -6],[0, 0],[1, -6]]]}]},
					{"size_x":3, "size_z":3, "size_y":3, "shapes":[{"name":"corner_garden",  "map":[[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[1, -4],[1, -1, -6],[1, -2, 0]],
																									[[0, 0, 0],[2, -6, 0],[0, 0, 0]]]},
																   {"name":"left_garden_2",  "map":[[[0, 0, 0],[0, 0, 0],[1, 1, -6]],
																									[[1, -5, 0],[1, -5, 0],[1, 1, -6]],
																									[[0, 0, 0],[0, 0, 0],[2, 1, -6]]]},
																   {"name":"right_garden_2", "map":[[[1, 1, -6],[0, 0, 0],[0, 0, 0]],
																									[[1, 1, -6],[1, -5, 0],[1, -5, 0]],
																									[[2, 1, -6],[0, 0, 0],[0, 0, 0]]]},
																   {"name":"right_garden",   "map":[[[1, 1, -3],[1, 1, -3],[1, 1, -3]],
																									[[1, 1, -1],[1, 1, -1],[1, 1, -1]],
																									[[2, -6, 0],[0, 0, 0],[0, 0, 0]]]},
																   {"name":"right_garden",   "map":[[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[2, -6, 0],[0, 0, 0],[0, 0, 0]]]},
																   {"name":"left_garden",    "map":[[[1, 1, -3],[1, 1, -3],[1, 1, -3]],
																									[[1, 1, -1],[1, 1, -1],[1, 1, -1]],
																									[[0, 0, 0],[0, 0, 0],[2, -6, 0]]]},
																   {"name":"left_garden",    "map":[[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[0, 0, 0],[0, 0, 0],[2, -6, 0]]]},
																   {"name":"mid_garden",     "map":[[[1, 1, -3],[1, 1, -3],[1, 1, -3]],
																									[[1, 1, -1],[2, 1, -1],[1, 1, -1]],
																									[[1, 1, -6],[0, 0, 0],[1, 1, -6]]]},
																   {"name":"square_left",    "map":[[[1, -3, 0],[1, -3, 0],[1, -3, 0]],
																									[[1, 1, -5],[1, 1, -5],[1, 1, -5]],
																									[[2, -1, 0],[1, -1, 0],[1, -1, 0]]]},
																   {"name":"square_mid",     "map":[[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[1, -4, 0],[1, 1, -6],[1, -2, 0]],
																									[[1, -4, 0],[2, 1, -6],[1, -2, 0]]]},
																   {"name":"square_right",   "map":[[[1, -3, 0],[1, -3, 0],[1, -3, 0]],
																									[[1, 1, -5],[1, 1, -5],[1, 1, -5]],
																									[[1, -1, 0],[1, -1, 0],[2, -1, 0]]]}]}]

var v_wood_beam = preload("res://scenes/house_structs/v_wood_beam.tscn")
var v_corner_wood_beam = preload("res://scenes/house_structs/v_corner_wood_beam.tscn")
var h_wood_beam = preload("res://scenes/house_structs/h_wood_beam.tscn")
var h_corner_wood_beam = preload("res://scenes/house_structs/h_corner_wood_beam.tscn")
var v_stone_ground = preload("res://scenes/house_structs/v_stone_ground.tscn")
var h_stone_ground = preload("res://scenes/house_structs/h_stone_ground.tscn")
var house_floor = preload("res://scenes/house_structs/house_floor.tscn")
var house_entrance_floor = preload("res://scenes/house_structs/house_entrance_floor.tscn")
var house_wall = preload("res://scenes/house_structs/house_wall.tscn")
var simple_door = preload("res://scenes/house_structs/simple_door.tscn")
var roof = preload("res://scenes/house_structs/roof.tscn")
var corner_v_roof = preload("res://scenes/house_structs/corner_v_roof.tscn")
var top_v_roof = preload("res://scenes/house_structs/top_v_roof.tscn")
var wood_beam_roof = preload("res://scenes/house_structs/wood_beam_roof.tscn")

var rng = RandomNumberGenerator.new()
var seed:int
var house_map:Array
var module_map:Array
var house_shape:Dictionary
const max_size = 10
const max_height = 5
var size_x:int
var size_y:int
var size_z:int

var n_modules_x:int
var n_modules_z:int
var n_modules_y:int

var entrance_dir:int

func get_modular_map() -> Array:
	var module_map = []
	for z in range(n_modules_z):
		module_map.append([])
		for x in range(n_modules_x):
			module_map[z].append([])
			for y in range(n_modules_y):
				module_map[z][x].append(1) 
	module_map[n_modules_z-1][rng.randi_range(0, n_modules_x-1)][0] = 2
				
	for shape in house_shapes:
		if shape.size_x > n_modules_x and shape.size_z > n_modules_z and shape.size_y > n_modules_y: break
		elif shape.size_x == n_modules_x and shape.size_z == n_modules_z and shape.size_y == n_modules_y:
			house_shape = shape.shapes[rng.randi_range(0, shape.shapes.size()-1)]
			print(house_shape)
			module_map = house_shape.map
			break
	return module_map
	
func gen_module_map(n_modules:int):
	print("gen_module_map | n_modules:{n_modules}".format({"n_modules":n_modules}))
	module_map = []
	
	for z in range(n_modules_z):
		module_map.append([])
		for x in range(n_modules_x):
			module_map[z].append([])
			for y in range(n_modules_y):
				module_map[z][x].append(0)

	for y in range(n_modules_y):
		for z in range(n_modules_z):
			var line = ""
			for x in range(n_modules_x):
				line += "{n} ".format({"n":module_map[z][x][y]})
			print(line)
		print('\n')
		
func gen_house_map():
	for z in range(size_z):
		house_map.append([])
		for x in range(size_x):
			house_map[z].append([])
			for y in range(size_y+3):
				house_map[z][x].append({"type":null, "direction":0})
				
	for z in range(size_z): for x in range(size_x): for y in range(size_y-1):
			var mx_mz = module_map[z/2-1][x/2-1][y/2] if x > 1 and z > 1 else 0
			var mx_pz = module_map[z/2][x/2-1][y/2] if x > 1 and z < size_z-1 else 0
			var px_mz = module_map[z/2-1][x/2][y/2] if x < size_x-1 and z > 1 else 0
			var px_pz = module_map[z/2][x/2][y/2] if x < size_x-1 and z < size_z-1 else 0
			var cords = Vector3(x % 2, y % 2, z % 2)
			match cords:
				Vector3(0, 0, 0): 
					if y == 0:
						if mx_mz > 0 and not px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 0}
						elif not mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and not px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 1}
						elif not mx_mz > 0 and not px_mz > 0 and not mx_pz > 0 and px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 2}
						elif not mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 3}
						elif mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 0}
						elif mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and not px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 1}
						elif not mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 2}
						elif not mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 3}
						elif not mx_mz > 0 and px_mz > 0 and mx_pz > 0 and px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 0}
						elif mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 1}
						elif mx_mz > 0 and px_mz > 0 and mx_pz > 0 and not px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 2}
						elif mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and  px_pz > 0:
							house_map[z][x][0] = {"type":"v_stone_ground", "direction": 3}
				Vector3(1, 0, 0): 
					if y == 0:
						if px_mz  > 0 and px_pz == 0: house_map[z][x][0] = {"type":"h_stone_ground", "direction": 0}
						elif px_mz == 0 and px_pz > 0: house_map[z][x][0] = {"type":"h_stone_ground", "direction": 2}
				Vector3(0, 0, 1):
					if y == 0:
						if mx_pz > 0 and px_pz == 0: house_map[z][x][0] = {"type":"h_stone_ground", "direction": 1}
						elif mx_pz == 0 and px_pz > 0: house_map[z][x][0] = {"type":"h_stone_ground", "direction": 3}
				Vector3(1, 0, 1):
					if px_pz == 2: house_map[z][x][y] = {"type":"house_entrance_floor", "direction": 0}
					elif px_pz != 0: house_map[z][x][y] = {"type":"house_floor", "direction":0}
				Vector3(0, 1, 0):
					if mx_mz > 0 and not px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 0}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 0}
					elif not mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and not px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 1}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 1}
					elif not mx_mz > 0 and not px_mz > 0 and not mx_pz > 0 and px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 2}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 2}
					elif not mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 3}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 3}
						
					elif mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
						house_map[z][x][y] = {"type":"v_wood_beam", "direction": 0}
						house_map[z][x][y+1] = {"type":"h_wood_beam", "direction": 0}
					elif mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and not px_pz > 0:
						house_map[z][x][y] = {"type":"v_wood_beam", "direction": 1}
						house_map[z][x][y+1] = {"type":"h_wood_beam", "direction": 1}
					elif not mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and px_pz > 0:
						house_map[z][x][y] = {"type":"v_wood_beam", "direction": 2}
						house_map[z][x][y+1] = {"type":"h_wood_beam", "direction": 2}
					elif not mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and px_pz > 0:
						house_map[z][x][y] = {"type":"v_wood_beam", "direction": 3}
						house_map[z][x][y+1] = {"type":"h_wood_beam", "direction": 3}
						
					elif not mx_mz > 0 and px_mz > 0 and mx_pz > 0 and px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 0}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 0}
					elif mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 1}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 1}
					elif mx_mz > 0 and px_mz > 0 and mx_pz > 0 and not px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 2}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 2}
					elif mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and  px_pz > 0:
						house_map[z][x][y] = {"type":"v_corner_wood_beam", "direction": 3}
						house_map[z][x][y+1] = {"type":"h_corner_wood_beam", "direction": 3}
						
					elif mx_mz < 0 and not px_mz < 0 and not mx_pz < 0:
						var direction = abs((mx_mz) + 1) % 4
						house_map[z][x][y] = {"type":"roof", "direction": direction}
					elif not mx_mz < 0 and mx_pz < 0 and not px_pz < 0:
						var direction = abs((mx_pz - 2 if mx_pz == -5 else mx_pz) + 1) % 4
						house_map[z][x][y] = {"type":"roof", "direction": direction}
					elif not px_mz < 0 and not mx_pz < 0 and px_pz < 0:
						var direction = abs((px_pz - 2 if px_pz <= -5 else px_pz) + 1) % 4
						house_map[z][x][y] = {"type":"roof", "direction": direction}
					elif not mx_mz < 0 and px_mz < 0 and not px_pz < 0:
						var direction = abs((px_mz - 2 if px_mz == -6 else px_mz) + 1) % 4
						house_map[z][x][y] = {"type":"roof", "direction": direction}
						
					elif mx_mz < 0 and px_mz < 0 and not mx_pz < 0 and not px_pz < 0:
						if mx_mz % 4 == -1 and px_mz % 4 == -1: house_map[z][x][y] = {"type":"roof", "direction": 0}
						elif (mx_mz + px_mz) % 2 == 0: house_map[z][x][y] = {"type":"v_wood_beam", "direction": 0}
						elif mx_mz % 4 == -2 and px_mz % 4 == -1: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 0}
						elif mx_mz % 4 == -1 and px_mz % 4 == 3: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 3}
					elif mx_mz < 0 and not px_mz < 0 and mx_pz < 0 and not px_pz < 0:
						if mx_mz % 4 == -2 and mx_pz % 4 == -2: house_map[z][x][y] = {"type":"roof", "direction": 1}
						elif (mx_mz + mx_pz) % 2 == 0: house_map[z][x][y] = {"type":"v_wood_beam", "direction": 1}
						elif mx_mz % 4 == -2 and mx_pz % 4 == -1: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 1}
						elif mx_mz % 4 == -1 and mx_pz % 4 == -2: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 0}
					elif not mx_mz < 0 and not px_mz < 0 and mx_pz < 0 and px_pz < 0:
						if px_pz == -5: px_pz -= 2
						if mx_pz == -5: mx_pz -= 2
						if mx_pz % 4 == -3 and px_pz % 4 == -3: house_map[z][x][y] = {"type":"roof", "direction": 2}
						elif (mx_pz + px_pz) % 2 == 0: house_map[z][x][y] = {"type":"v_wood_beam", "direction": 2}
						elif mx_pz % 4 == -3 and px_pz % 4 == 0: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 2}
						elif mx_pz % 4 == -2 and px_pz % 4 == -3: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 1}
					elif not mx_mz < 0 and px_mz < 0 and not mx_pz < 0 and px_pz < 0:
						if px_mz == -6: px_mz -= 2
						if px_pz == -6: px_pz -= 2
						if px_mz % 4 == 0 and px_pz % 4 == 0: house_map[z][x][y] = {"type":"roof", "direction": 3}
						elif (px_mz + px_pz) % 2 == 0: house_map[z][x][y] = {"type":"v_wood_beam", "direction": 3}
						elif px_mz % 4 == -1 and px_pz % 4 == 0: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 3}
						elif px_mz % 4 == 0 and px_pz % 4 == -1: house_map[z][x][y] = {"type":"corner_v_roof", "direction": 2}
						
					elif mx_mz < 0 and px_mz < 0 and mx_pz < 0 and not px_pz < 0:
						house_map[z][x][y] = {"type":"corner_v_roof", "direction": 0}
					elif mx_mz < 0 and not px_mz < 0 and mx_pz < 0 and  px_pz < 0:
						house_map[z][x][y] = {"type":"corner_v_roof", "direction": 1}
					elif not mx_mz < 0 and px_mz < 0 and mx_pz < 0 and px_pz < 0:
						house_map[z][x][y] = {"type":"corner_v_roof", "direction": 2}
					elif mx_mz < 0 and px_mz < 0 and not mx_pz < 0 and px_pz < 0:
						house_map[z][x][y] = {"type":"corner_v_roof", "direction": 3}
						
					if ((mx_mz < 0 and px_mz < 0) or (mx_pz < 0 and px_pz < 0)) and ((mx_mz == -4 and px_mz == -2) or (mx_pz == -4 and px_pz == -2)): 
						house_map[z][x][y+2] = {"type":"top_v_roof", "direction": 1}
					elif ((mx_mz == -3 and mx_pz == -1) or (px_mz == -3 and px_pz == -1)): house_map[z][x][y+2] = {"type":"top_v_roof", "direction": 0}
				Vector3(1, 1, 0):
					if px_mz  > 0 and px_pz == 0: house_map[z][x][y] = {"type":"house_wall", "direction": 0}
					elif px_mz == 0 and px_pz > 0: house_map[z][x][y] = {"type":"house_wall", "direction": 2}
					elif px_mz in [-1, -5] and px_pz == 0: house_map[z][x][y] = {"type":"roof", "direction": 0}
					elif px_mz == 0 and px_pz in [-3, -5]: house_map[z][x][y] = {"type":"roof", "direction": 2}
					elif px_mz == -6 and px_pz == 0: house_map[z][x][y] = {"type":"wood_beam_roof", "direction": 0}
					elif px_mz == 0 and px_pz == -6: house_map[z][x][y] = {"type":"wood_beam_roof", "direction": 2}
					if px_mz == -2 or px_pz == -2: house_map[z][x][y+1] = {"type":"roof", "direction": 1}
					elif px_mz == -4 or px_pz == -4: house_map[z][x][y+1] = {"type":"roof", "direction": 3}
					elif px_mz == -6 or px_pz == -6: house_map[z][x][y+1] = {"type":"top_v_roof", "direction": 1}
					if px_mz % 2 == -1 and px_pz % 2 == -1: house_map[z][x][y+2] = {"type":"top_v_roof", "direction": 0}
				Vector3(0, 1, 1):
					if mx_pz > 0 and px_pz == 0: house_map[z][x][y] = {"type":"house_wall", "direction": 1}
					elif mx_pz == 0 and px_pz > 0: house_map[z][x][y] = {"type":"house_wall", "direction": 3}
					elif mx_pz in [-2, -6] and px_pz == 0: house_map[z][x][y] = {"type":"roof", "direction": 1}
					elif mx_pz == 0 and px_pz in [-4, -6]: house_map[z][x][y] = {"type":"roof", "direction": 3}
					elif mx_pz == -5 and px_pz == 0: house_map[z][x][y] = {"type":"wood_beam_roof", "direction": 1}
					elif mx_pz == 0 and px_pz == -5: house_map[z][x][y] = {"type":"wood_beam_roof", "direction": 3}
					if mx_pz == -1 or px_pz == -1: house_map[z][x][y+1] = {"type":"roof", "direction": 0}
					elif mx_pz == -3 or px_pz == -3: house_map[z][x][y+1] = {"type":"roof", "direction": 2}
					elif mx_pz == -5 or px_pz == -5: house_map[z][x][y+1] = {"type":"top_v_roof", "direction": 0}
					if mx_pz < 0 and px_pz < 0 and mx_pz % 2 == 0 and px_pz % 2 == 0: house_map[z][x][y+2] = {"type":"top_v_roof", "direction": 1}
				Vector3(1, 1, 1):
					if px_pz < -4: house_map[z][x][y+1] = {"type":"top_v_roof", "direction": abs(px_pz + 1 % 4)}
					elif px_pz < 0: house_map[z][x][y+1] = {"type":"roof", "direction": abs(px_pz + 1 % 4)}
func set_main_door():
	for z in range(n_modules_z):
		for x in range(n_modules_x):
			if house_shape.map[z][x] == 2:
				match entrance_dir:
					0: 
						house_map[z * 2 + 2][x * 2 + 1][0] = {"type":"simple_door", "direction":entrance_dir}
						house_map[z * 2 + 1][x * 2 + 1][0] = {"type":"house_entrance_floor", "direction":entrance_dir}
					1: 
						house_map[z * 2 + 1][x * 2][0] = {"type":"simple_door", "direction":entrance_dir}
						house_map[z * 2 + 1][x * 2 + 1][0] = {"type":"house_entrance_floor", "direction":entrance_dir}
					2: 
						house_map[z * 2][x * 2 + 1][0] = {"type":"simple_door", "direction":entrance_dir}
						house_map[z * 2 + 1][x * 2 + 1][0] = {"type":"house_entrance_floor", "direction":entrance_dir}
					3: 
						house_map[z * 2 + 1][x * 2 + 2][0] = {"type":"simple_door", "direction":entrance_dir}
						house_map[z * 2 + 1][x * 2 + 1][0] = {"type":"house_entrance_floor", "direction":entrance_dir}
		
func set_garden():
	for z in range(n_modules_z):
		for x in range(n_modules_x):
			if module_map[z][x] == 0:
				for y in range(size_y):
					house_map[z*2+1][x*2+1][y] = {"type":"garden", "direction":entrance_dir}
					if z == 0:
						house_map[z*2][x*2+1][y] = {"type":"garden", "direction":entrance_dir}
					if x == 0:
						house_map[z*2+1][x*2][y] = {"type":"garden", "direction":entrance_dir}
					if z == n_modules_z-1:
						house_map[z*2+2][x*2+1][y] = {"type":"garden", "direction":entrance_dir}
					if x == n_modules_x-1:
						house_map[z*2+1][x*2+2][y] = {"type":"garden", "direction":entrance_dir}
					if z == 0 and x == 0:
						house_map[z*2][x*2][y] = {"type":"garden", "direction":entrance_dir}
					if z == 0 and x == n_modules_x-1:
						house_map[z*2][x*2+2][y] = {"type":"garden", "direction":entrance_dir}
					if z == n_modules_z-1 and x == 0:
						house_map[z*2+2][x*2][y] = {"type":"garden", "direction":entrance_dir}
					if z == n_modules_z-1 and x == n_modules_x-1:
						house_map[z*2+2][x*2+2][y] = {"type":"garden", "direction":entrance_dir}


func _init(_n_modules_x:int, _n_modules_z:int, _n_modules_y:int=1, _seed:int=rng.randi_range(100000, 999999)):
	seed = _seed
	n_modules_x = _n_modules_x
	n_modules_y = _n_modules_y
	n_modules_z = _n_modules_z
	
	size_x = n_modules_x * 2 + 1
	size_z = n_modules_z * 2 + 1
	size_y = n_modules_y * 2 + 1
	
	module_map = get_modular_map()

	gen_house_map()

	#set_garden(main_door_dir)
	#set_main_door(main_door_dir)
	
func structs_instantiate(struct:Dictionary) -> Node3D:
	match struct.type:
		"house_entrance_floor": return house_entrance_floor.instantiate()
		"house_floor": return house_floor.instantiate()
		"simple_door": return simple_door.instantiate()
		"v_wood_beam": return v_wood_beam.instantiate()
		"v_corner_wood_beam": return v_corner_wood_beam.instantiate()
		"v_stone_ground": return v_stone_ground.instantiate()
		"h_stone_ground": return h_stone_ground.instantiate()
		"h_wood_beam": return h_wood_beam.instantiate()
		"h_corner_wood_beam": return h_corner_wood_beam.instantiate()
		"house_wall": return house_wall.instantiate()
		"roof": return roof.instantiate()
		"top_v_roof": return top_v_roof.instantiate()
		"corner_v_roof": return corner_v_roof.instantiate()
		"wood_beam_roof": return wood_beam_roof.instantiate()
	return null
	 
	
func load_house(house_node: Node3D):
	for z in range(size_z):
		for x in range(size_x):
			for y in range(size_y+3):
				var struct_node = structs_instantiate(house_map[z][x][y])
				if struct_node:
					struct_node.rotate_y(house_map[z][x][y]["direction"] * PI/2)
					struct_node.transform.origin = Vector3(x*1.5, y*1.5, z*1.5)
					house_node.add_child(struct_node)


