extends Area2D

var up_input = "paddle_up"
var down_input = "paddle_down"

const MAX_VELOCITY = 10.0
var velocity= 0.0
var accleration = 50.0

func _physics_process(_delta: float) -> void:
	var move_dir = 0.0
	
	move_dir = Input.get_axis("paddle_up", "paddle_down")
	print(move_dir)
