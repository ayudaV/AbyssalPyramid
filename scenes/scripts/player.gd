extends CharacterBody3D

@export var speed = 7.0
@export var walk_speed = 7.0
@export var jump_strength = 0.7
@export var gravity = 50.0
@export var climb_speed = 5.0

@onready var _spring_arm:SpringArm3D = $SpringArm3D
@onready var _player_move:Node3D = $"Player_move"
@onready var _wall_check:RayCast3D = $"Player_move/WallCheck/WallCheckRayCast"
@onready var _still_on_wall:RayCast3D = $"Player_move/WallCheck/StillOnWallCheckRayCast"
var is_climbing = false
var look_direction = 0.0
var move_direction = Vector3.ZERO

func input(delta: float) -> void:
	move_direction = Vector3.ZERO
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.z = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y).normalized()

	velocity.x = move_direction.x * speed
	velocity.z = move_direction.z * speed
	velocity.y -= gravity * delta 
	
	var is_jumping = is_on_floor() and Input.is_action_just_pressed("jump")
	if is_jumping:
		velocity.y = jump_strength

func climbing():
	if Input.is_action_pressed("climb") and _wall_check.is_colliding():
		if _still_on_wall.is_colliding():
			is_climbing = true
		else:
			velocity.y = jump_strength
			await get_tree().create_timer(0.3)
			is_climbing = false
	else:
		is_climbing = false
		
	if is_climbing:
		gravity = 0
		speed = climb_speed
		if Input.is_action_just_pressed("jump"):
			velocity.y = speed
		#velocity = Vector3.ZERO
		#move_direction = Vector3.ZERO
		#var rot = (atan2(_wall_check.get_collision_normal().z, _wall_check.get_collision_normal().x) - PI/2)
		#move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		#move_direction.z = Input.get_action_strength("down") - Input.get_action_strength("up")
		#move_direction.y =  Input.is_action_just_pressed("jump")
		#move_direction = move_direction.rotated(Vector3.UP, rot).normalized()
	else:
		speed = walk_speed
		gravity = 50.0
func _physics_process(delta: float) -> void:
	input(delta)
	#climbing()
	move_and_slide()
	
func _process(delta: float) -> void:
	_spring_arm.global_position = global_position + Vector3(0, 0.2, 0) 
	if velocity != Vector3.ZERO:
		if is_climbing:
			look_direction = (atan2(_wall_check.get_collision_normal().z, _wall_check.get_collision_normal().x) - PI/2)
		else:
			look_direction =  (Vector2(velocity.z, velocity.x).angle() - PI)
		_player_move.rotation.y = look_direction

