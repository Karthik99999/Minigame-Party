extends Node2D

func _ready():
	# set up game over dialog
	$GameOverDialog.get_ok().text = "Restart"
	$GameOverDialog.get_cancel().text = "Main Menu"
	$GameOverDialog.get_cancel().connect("pressed", self, "main_menu")


func restart_game():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
	
func main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Main_Menu.tscn")
