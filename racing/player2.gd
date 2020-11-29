extends KinematicBody2D

var movespeed = 450
func _ready():
	pass
func _physics_process(_delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up2"):
		motion.y -= 1
	if Input.is_action_pressed("down2"):
		motion.y += 1
	if Input.is_action_pressed("right2"):
		motion.x += 1
	if Input.is_action_pressed("left2"):
		motion.x -= 1
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	
