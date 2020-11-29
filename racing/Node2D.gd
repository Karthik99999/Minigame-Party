extends Node2D


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverDialog.get_ok().text = "Restart"
	$GameOverDialog.get_cancel().text = "Main Menu"
	$GameOverDialog.get_cancel().connect("pressed", self, "main_menu")
	


func main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Main_Menu.tscn")


func _on_GameOverDialog_confirmed():
	get_tree().paused = false
	get_tree().reload_current_scene()
