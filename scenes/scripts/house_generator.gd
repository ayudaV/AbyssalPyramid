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
					{"size_x":3, "size_z":3, "size_y":2, "shapes":[{"name":"corner_garden",  "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[0, 0],[2, -1],[0, 0]]]},
																   {"name":"left_garden_2",  "map":[[[0, 0],[0, 0],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[0, 0],[0, 0],[2, -1]]]},
																   {"name":"right_garden_2", "map":[[[1, -1],[0, 0],[0, 0]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[2, -1],[0, 0],[0, 0]]]},
																   {"name":"right_garden",   "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[2, -1],[0, 0],[0, 0]]]},
																   {"name":"left_garden",    "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[0, 0],[0, 0],[2, -1]]]},
																   {"name":"mid_garden_2",   "map":[[[1, -1],[2, -1],[1, -1]],
																									[[1, -1],[0, 0],[1, -1]],
																									[[1, -1],[0, 0],[1, -1]]]},
																   {"name":"mid_garden",     "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[2, -1],[1, -1]],
																									[[1, -1],[0, 0],[1, -1]]]},
																   {"name":"square_left",    "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[2, -1],[1, -1],[1, -1]]]},
																   {"name":"square_mid",     "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[2, -1],[1, -1]]]},
																   {"name":"square_right",   "map":[[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[1, -1]],
																									[[1, -1],[1, -1],[2, -1]]]}]}]

var v_wood_beam = preload("res://scenes/house_structs/v_wood_beam.tscn")
var v_corner_wood_beam = preload("res://scenes/house_structs/v_corner_wood_beam.tscn")
var h_wood_beam = preload("res://scenes/house_structs/h_wood_beam.tscn")
var h_corner_wood_beam = preload("res://scenes/house_structs/h_corner_wood_beam.tscn")
var house_floor = preload("res://scenes/house_structs/house_floor.tscn")
var house_entrance_floor = preload("res://scenes/house_structs/house_entrance_floor.tscn")
var house_wall = preload("res://scenes/house_structs/house_wall.tscn")
var simple_door = preload("res://scenes/house_structs/simple_door.tscn")
var roof = preload("res://scenes/house_structs/roof.tscn")
var roof_v = preload("res://scenes/house_structs/roof_v.tscn")

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

func rotated_map(map:Array, columns:int, lines:int, rotation:int):
	for l in map:
		print(l)

	var new_map = []
	match rotation:
		0: new_map = map
		1:
			for z in range(columns):
				new_map.append([])
				for x in range(lines):
					new_map[z].append(map[x][columns-1-z])
		2:
			for z in range(lines):
				new_map.append([])
				for x in range(columns):
					new_map[z].append(map[lines-1-z][columns-1-x])
		3:
			for z in range(columns):
				new_map.append([])
				for x in range(lines):
					new_map[z].append(map[lines-1-x][z])
				

	print('new_map')
	for l in new_map:
		print(l)
	return new_map
	
func hm(n:int): return n * 2 + 1

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
	
	module_map = []
	for z in range(n_modules_z):
		module_map.append([])
		for x in range(n_modules_x):
			module_map[z].append([])
			for y in range(n_modules_y):
				module_map[z][x].append(1)
	module_map[n_modules_z-1][rng.randi_range(0, n_modules_x-1)][0] = 2
				
	for shape in house_shapes:
		if shape.size_x > n_modules_x and shape.size_z > n_modules_z and shape.size_y > n_modules_y:
			break
		if shape.size_x == n_modules_x and shape.size_z == n_modules_z and shape.size_y == n_modules_y:
			house_shape = shape.shapes[rng.randi_range(0, shape.shapes.size()-1)]
			print(house_shape)
			module_map = house_shape.map
			break;

	house_map = []
	for z in range(size_z):
		house_map.append([])
		for x in range(size_x):
			house_map[z].append([])
			for y in range(size_y):
				var mx_mz = module_map[int(z/2)-1][int(x/2)-1][int(y/2)] if x > 1 and z > 1 and y < size_y-1 else 0
				var mx_pz = module_map[int(z/2)][int(x/2)-1][int(y/2)] if x > 1 and z < size_z-1 and y < size_y-1 else 0
				var px_mz = module_map[int(z/2)-1][int(x/2)][int(y/2)] if x < size_x-1 and z > 1 and y < size_y-1 else 0
				var px_pz = module_map[int(z/2)][int(x/2)][int(y/2)] if x < size_x-1 and z < size_z-1 and y < size_y-1 else 0
				if z % 2 == 1 and x % 2 == 1 and y % 2 == 0 and y < size_y-1:
					match px_pz:
						0: house_map[z][x].append({"type":"garden", "direction": 0})
						1: house_map[z][x].append({"type":"house_floor", "direction":0})
						2: house_map[z][x].append({"type":"house_entrance_floor", "direction": 0})
					house_map[z][x].append({"type":null, "direction":0})
				elif z % 2 == 0 and x % 2 == 0 and y % 2 == 1:
					if mx_mz > 0 and not px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 0})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 0})
					elif not mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and not px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 1})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 1})
					elif not mx_mz > 0 and not px_mz > 0 and not mx_pz > 0 and px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 2})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 2})
					elif not mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 3})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 3})
					elif mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and not px_pz > 0:
						house_map[z][x].append({"type":"v_wood_beam", "direction": 0})
						house_map[z][x].append({"type":"h_wood_beam", "direction": 0})
					elif mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and not px_pz > 0:
						house_map[z][x].append({"type":"v_wood_beam", "direction": 1})
						house_map[z][x].append({"type":"h_wood_beam", "direction": 1})
					elif not mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and px_pz > 0:
						house_map[z][x].append({"type":"v_wood_beam", "direction": 2})
						house_map[z][x].append({"type":"h_wood_beam", "direction": 2})
					elif not mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and px_pz > 0:
						house_map[z][x].append({"type":"v_wood_beam", "direction": 3})
						house_map[z][x].append({"type":"h_wood_beam", "direction": 3})
					elif not mx_mz > 0 and px_mz > 0 and mx_pz > 0 and px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 0})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 0})
					elif mx_mz > 0 and px_mz > 0 and not mx_pz > 0 and px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 1})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 1})
					elif mx_mz > 0 and px_mz > 0 and mx_pz > 0 and not px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 2})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 2})
					elif mx_mz > 0 and not px_mz > 0 and mx_pz > 0 and  px_pz > 0:
						house_map[z][x].append({"type":"v_corner_wood_beam", "direction": 3})
						house_map[z][x].append({"type":"h_corner_wood_beam", "direction": 3})
					
					elif mx_mz < 0 and not px_mz < 0 and not mx_pz < 0:
						var count_x = 1
						var count_z = 1
						while module_map[z/2-1][x/2-1-count_x][int(y/2)] if x/2 > count_x else 0 != 0: count_x += 1
						while module_map[z/2-1-count_z][x/2-1][int(y/2)] if z/2 > count_z else 0 != 0: count_z += 1
						print('rot_0', count_x, count_z)
						var direction = 0 if count_x > count_z else 1
						house_map[z][x].append({"type":"roof", "direction": direction})
					elif not mx_mz < 0 and mx_pz < 0 and not px_pz < 0:
						var count_x = 1
						var count_z = 1
						while module_map[z/2][x/2-1-count_x][int(y/2)] if x/2 > count_x else 0 != 0: count_x += 1
						while module_map[z/2+count_z][x/2-1][int(y/2)] if z/2 + count_z < n_modules_z else 0 != 0: count_z += 1
						print('rot_1', count_x, count_z)
						var direction = 2 if count_x > count_z else 1
						house_map[z][x].append({"type":"roof", "direction": direction})
					elif not px_mz < 0 and not mx_pz < 0 and px_pz < 0:
						var count_x = 1
						var count_z = 1
						while module_map[z/2][x/2+count_x][int(y/2)] if x/2 + count_x < n_modules_x else 0 != 0: count_x += 1
						while module_map[z/2+count_z][x/2][int(y/2)] if z/2 + count_z < n_modules_z else 0 != 0: count_z += 1
						print('rot_2', count_x, count_z)
						var direction = 2 if count_x > count_z else 3
						house_map[z][x].append({"type":"roof", "direction": direction})
					elif not mx_mz < 0 and px_mz < 0 and not px_pz < 0:
						var count_x = 0
						var count_z = 0
						while module_map[z/2-1][x/2+count_x][int(y/2)] if x/2 + count_x < n_modules_x else 0 != 0: count_x += 1
						while module_map[z/2-1-count_z][x/2][int(y/2)] if z/2 > count_z else 0 != 0: count_z += 1
						print('rot_3', count_x, count_z)
						var direction = 0 if count_x > count_z else 3
						house_map[z][x].append({"type":"roof", "direction": direction})
					elif mx_mz < 0 and px_mz < 0 and not mx_pz < 0 and not px_pz < 0:
						house_map[z][x].append({"type":"roof", "direction": 0})
					elif mx_mz < 0 and not px_mz < 0 and mx_pz < 0 and not px_pz < 0:
						house_map[z][x].append({"type":"roof", "direction": 1})
					elif not mx_mz < 0 and not px_mz < 0 and mx_pz < 0 and px_pz < 0:
						house_map[z][x].append({"type":"roof", "direction": 2})
					elif not mx_mz < 0 and px_mz < 0 and not mx_pz < 0 and px_pz < 0:
						house_map[z][x].append({"type":"roof", "direction": 3})
					elif mx_mz < 0 and px_mz < 0 and mx_pz < 0 and not px_pz < 0:
						house_map[z][x].append({"type":"roof_v", "direction": 0})
					elif mx_mz < 0 and not px_mz < 0 and mx_pz < 0 and  px_pz < 0:
						house_map[z][x].append({"type":"roof_v", "direction": 1})
					elif not mx_mz < 0 and px_mz < 0 and mx_pz < 0 and px_pz < 0:
						house_map[z][x].append({"type":"roof_v", "direction": 2})
					elif mx_mz < 0 and px_mz < 0 and not mx_pz < 0 and px_pz < 0:
						house_map[z][x].append({"type":"roof_v", "direction": 3})
					else: house_map[z][x].append({"type":null, "direction":0})
				elif z % 2 == 0 and x % 2 == 1 and y % 2 == 1:
					if px_mz > 0 and not px_pz > 0: house_map[z][x].append({"type":"house_wall", "direction": 0})
					elif not px_mz > 0 and px_pz > 0: house_map[z][x].append({"type":"house_wall", "direction": 2})
					else: house_map[z][x].append({"type":null, "direction":0})
					house_map[z][x].append({"type":null, "direction":0})
				elif z % 2 == 1 and x % 2 == 0 and y % 2 == 1:
					if mx_pz > 0 and not px_pz > 0: house_map[z][x].append({"type":"house_wall", "direction": 1})
					elif not mx_pz > 0 and px_pz > 0: house_map[z][x].append({"type":"house_wall", "direction": 3})
					else: house_map[z][x].append({"type":null, "direction":0})
					house_map[z][x].append({"type":null, "direction":0})
				else: house_map[z][x].append({"type":null, "direction":0})

	#set_garden(main_door_dir)
	#set_main_door(main_door_dir)
	
func structs_instantiate(struct:Dictionary) -> Node3D:
	match struct.type:
		"house_entrance_floor": return house_entrance_floor.instantiate()
		"house_floor": return house_floor.instantiate()
		"simple_door": return simple_door.instantiate()
		"v_wood_beam": return v_wood_beam.instantiate()
		"v_corner_wood_beam": return v_corner_wood_beam.instantiate()
		"h_wood_beam": return h_wood_beam.instantiate()
		"h_corner_wood_beam": return h_corner_wood_beam.instantiate()
		"house_wall": return house_wall.instantiate()
		"roof": return roof.instantiate()
		"roof_v": return roof_v.instantiate()
	return null
	 
	
func load_house(house_node: Node3D):
	for z in range(size_z):
		for x in range(size_x):
			for y in range(size_y):
				var struct_node = structs_instantiate(house_map[z][x][y])
				if struct_node:
					struct_node.rotate_y(house_map[z][x][y]["direction"] * PI/2)
					struct_node.transform.origin = Vector3(x, y*1.5, z)
					house_node.add_child(struct_node)


