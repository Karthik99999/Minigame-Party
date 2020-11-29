extends Node2D
onready var timer = get_node("Timer")
onready var time = get_node("time")
onready var gameDoneDialog =  get_tree().get_root().get_node("World").get_node("gameDone")
onready var gameOverDialog =  get_tree().get_root().get_node("World").get_node("gameOver")
var gameOver = true

func _ready():
	timer.set_wait_time(7)
	timer.start()
	gameOverDialog.get_ok().text = "Restart"
	gameOverDialog.get_cancel().text = "Main Menu"
	gameOverDialog.get_cancel().connect("pressed", self, "main_menu")
	gameDoneDialog.get_ok().text = "Restart"
	gameDoneDialog.get_cancel().text = "Main Menu"
	gameDoneDialog.get_cancel().connect("pressed", self, "main_menu")

	
func _process(delta): 
	time.text = str(ceil(timer.time_left))
func _on_Timer_timeout():
	print_debug("timer time out")
	gameDoneDialog.show()
	
func _on_Area2D_area_entered(area):
	var collider = area.get_name()
	if collider == "Area2Dplayer":
		print_debug("player one wins")
		get_tree().paused = true
		gameOver = true
		print_debug("player one is yo mama")
		gameOverDialog.show()
		
func _on_gameDone_confirmed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_gameOver_confirmed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Main_Menu.tscn")
	
