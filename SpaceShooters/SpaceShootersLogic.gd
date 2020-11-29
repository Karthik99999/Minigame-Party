extends Node2D

func game_over(spaceship):
	var game_over_dialog = get_tree().get_root().get_node("Game").get_node("GameOverDialog")
	
	if spaceship.player_no == 1:
		game_over_dialog.dialog_text = "Player 2 wins!"
		get_tree().paused = true
		game_over_dialog.show()
	elif spaceship.player_no == 2:
		game_over_dialog.dialog_text = "Player 1 wins!"
		get_tree().paused = true
		game_over_dialog.show()


