extends KinematicBody2D

var movespeed = 450
onready var gameOverDialog =  get_tree().get_root().get_node("Node2D").get_node("GameOverDialog")

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

func _on_Area2D3_area_entered(area):
	if Finish.hit == 1:
		gameOverDialog.show()
