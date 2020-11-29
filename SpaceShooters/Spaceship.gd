extends KinematicBody2D

onready var bullet = preload("res://SpaceShooters/Bullet.tscn")
export(int) var player_no = 1 # defines which player's spaceship this is

var turn_speed = 3
var speed = 300
var rotation_dir = 0
var velocity = Vector2()

func get_input(delta):
	rotation_dir = 0
	velocity = Vector2()
	# player 1 movement
	if player_no == 1:
		if Input.is_key_pressed(KEY_A):
			rotation -= turn_speed * delta
		if Input.is_key_pressed(KEY_D):
			rotation += turn_speed * delta
		if Input.is_key_pressed(KEY_W):
			velocity = Vector2(speed, 0).rotated(rotation)
		if Input.is_key_pressed(KEY_S):
			velocity = Vector2(-speed, 0).rotated(rotation)
		if Input.is_action_just_pressed("ui_shoot1"):
			shoot()
	# player 2 movement
	elif player_no == 2:
		if Input.is_key_pressed(KEY_LEFT):
			rotation -= turn_speed * delta
		if Input.is_key_pressed(KEY_RIGHT):
			rotation += turn_speed * delta
		if Input.is_key_pressed(KEY_UP):
			velocity = Vector2(speed, 0).rotated(rotation)
		if Input.is_key_pressed(KEY_DOWN):
			velocity = Vector2(-speed, 0).rotated(rotation)
		if Input.is_action_just_pressed("ui_shoot2"):
			shoot()

	velocity = velocity.normalized() * speed

func shoot():
	var b = bullet.instance()
	b.start($Muzzle.global_position, rotation)
	get_parent().add_child(b)

func _physics_process(delta):
	get_input(delta)
	rotation += rotation_dir * turn_speed * delta
	velocity = move_and_slide(velocity)
