extends KinematicBody2D

var hit = 0
onready var gameOverDialog =  get_tree().get_root().get_node("Node2D").get_node("GameOverDialog")

func _on_Area2D1_area_entered(area):
	var collider = area.get_name()
	print_debug("hi")
	
func _on_Area2D_area_entered(area):
	var collider = area.get_name()
	print_debug(area)
	if collider == "Area2D3":
		gameOverDialog.dialog_text = "Player One WINS!!"
		gameOverDialog.show()
	elif collider == "Area2D2":
		gameOverDialog.dialog_text = "Player Two WINS!!"
		gameOverDialog.show()
	

