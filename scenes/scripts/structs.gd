extends Node3D

@onready var HouseGenerator = preload("res://scenes/scripts/house_generator.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	var house_1 = HouseGenerator.new(3, 3, 2)
	var house_2 = HouseGenerator.new(3, 3, 2)
	var house_3 = HouseGenerator.new(3, 3, 2)
	var house_4 = HouseGenerator.new(3, 3, 2)
	house_1.load_house(get_node("House1"))
	house_2.load_house(get_node("House2"))
	house_3.load_house(get_node("House3"))
	house_4.load_house(get_node("House4"))
