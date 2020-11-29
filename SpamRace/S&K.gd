extends Node2D

var game_state = 0 # current game state. 0 = playing | 1 = game over
onready var timer = $Game_Time
onready var timer_label = $Labels/Timer
onready var game_over = $YSort/GameOverDialog

onready var s_label = $Labels/S_Count
onready var k_label = $Labels/K_Count
var s_count = 0
var k_count = 0

func _ready():
	# start game timer
	timer.start()
	
	# set up game over dialog
	game_over.get_ok().text = "Restart"
	game_over.get_cancel().text = "Main Menu"
	game_over.get_cancel().connect("pressed", self, "main_menu")

func _process(delta):
	timer_label.text = str(ceil(timer.time_left))
	
	# check for input
	if game_state == 0: # only add to score if game is still being played
		if Input.is_action_just_pressed("ui_s"):
			s_count += 1
			s_label.text = str(s_count)
		if Input.is_action_just_pressed("ui_k"):
			k_count += 1
			k_label.text = str(k_count)

func _on_Game_Time_timeout():
	game_state = 1
	if s_count > k_count:
		game_over.dialog_text = "Player 1 wins!"
	elif k_count > s_count:
		game_over.dialog_text = "Player 2 wins!"
	elif k_count == s_count:
		game_over.dialog_text = "It's a draw!"
	game_over.show()

func restart_game():
	get_tree().reload_current_scene()

func main_menu():
	get_tree().change_scene("res://Main_Menu.tscn")
