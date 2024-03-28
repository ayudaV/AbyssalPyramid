extends Node3D

@onready var House = preload("res://scenes/scripts/house_generator.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	var house = House.new(5, 5)
	house.load_house(get_node("House"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
