extends KinematicBody2D

onready var gameOverDialog = $"../gameOver"
onready var gameDoneDialog =  $"../gameDone"
onready var player = $player
onready var player4 = $"/root/Player2"
onready var timer = $timer
var gameOver = false
var movespeed = 500
onready var player_collider = get_node("Area2Dplayer")
 
func _ready():
	#gameOverDialog.get_ok().text = "Restart"
	#gameOverDialog.get_cancel().text = "Main Menu"
	pass
func _physics_process(delta):
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

#func _on_Area2D_area_entered(area):
#	var collider = area.get_name()
#	if collider == "Area2Dplayer":
#		print_debug("player one wins")
#		get_tree().paused = true
#		gameOver = true
#		gameOverDialog.show()


