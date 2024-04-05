extends Node3D

@onready var HouseGenerator = preload("res://scenes/scripts/house_generator.gd")
var house:Node
# Called when the node enters the scene tree for the first time.
func _ready():
	house = HouseGenerator.new(3, 3, 2)
	house.load_house(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
