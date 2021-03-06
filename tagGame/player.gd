extends KinematicBody2D

var movespeed = 600

func _ready():
	pass
func _physics_process(_delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	
