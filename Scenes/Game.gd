extends Node


onready var hud = get_node("HUD")

signal goal_left
signal goal_right

var score_player_one = 0
var score_player_two = 0

var max_score = 3

onready var gameOverDialog = $GameOver


func _ready():
	update_score()
	$StartTimer.start()
	# set up game over dialog
	$GameOver.get_ok().text = "Restart"
	$GameOver.get_cancel().text = "Main Menu"
	$GameOver.get_cancel().connect("pressed", self, "main_menu")

func main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Main_Menu.tscn")


func _on_GoalLeft_body_entered(body):
	emit_signal("goal_left")	# Replace with function body.
	update_score()

func _on_GoalRight_body_entered(body):
	emit_signal("goal_right") # Replace with function body.
	update_score()

func _on_Game_goal_left():
	score_player_two += 1
	
	if score_player_two < max_score:
		start_new_round()
	else:
		gameOverDialog.show()

func _on_Game_goal_right():
	score_player_one += 1
	
	if score_player_one < max_score:
		start_new_round()
	else:
		gameOverDialog.show()

func start_new_round():
	$Ball.reset()
	$Paddle.set_position(Vector2(50, 256))
	$Player2.set_position(Vector2(974, 256))
	$StartTimer.start()


func _on_StartTimer_timeout():
	$Ball.set_start_direction()
	
func update_score():
	hud.get_node("PointsDisplay/ScorePlayer1").set_text(str(score_player_one))
	hud.get_node("PointsDisplay/ScorePlayer2").set_text(str(score_player_two))


func _on_GameOver_confirmed():
	score_player_one = 0
	score_player_two = 0
	update_score()
	start_new_round()
