extends VBoxContainer




func _on_SpaceShooterButton_pressed():
	get_tree().change_scene("res://SpaceShooters/SpaceOpen.tscn")


func _on_SpamRaceButton_pressed():
	get_tree().change_scene("res://SpamRace/S&K.tscn")


func _on_PongButton_pressed():
	get_tree().change_scene("res://Scenes/Node2D.tscn")


func _on_TagButton_pressed():
	get_tree().change_scene("res://tagGame/Openingscene.tscn")


func _on_RacingButton_pressed():
	get_tree().change_scene("res://racing/Node2D.tscn")
