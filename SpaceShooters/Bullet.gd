extends Area2D

var speed = 350
var velocity = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var motion = Vector2(cos(self.rotation), sin(self.rotation)) * speed
	position += motion * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	if body is KinematicBody2D:
		SpaceShootersLogic.game_over(body)
