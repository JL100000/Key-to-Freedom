extends Area2D

@export var is_ai = false

var active = true
var up_input = "paddle_up"
var down_input = "paddle_down"
var ai_target_ypos = 324.0
var velocity= 0.0
var accleration = 50.0

const MAX_HUMAN_VELOCITY = 14.0
const MAX_VELOCITY = 6.0

func _physics_process(delta: float) -> void:
	if !active: return
	var move_dir = 0.0
	if !is_ai:
		move_dir = Input.get_axis("paddle_up", "paddle_down")
		velocity = clampf(velocity, -MAX_HUMAN_VELOCITY, MAX_HUMAN_VELOCITY)
	else:
		move_dir = get_ai_movement_dir()
		velocity = clampf(velocity, -MAX_VELOCITY, MAX_VELOCITY)
	velocity += move_dir * accleration * delta
	if move_dir == 0.0:
		velocity = move_toward(velocity, 0.0, 2.0)
	global_position.y += velocity
	global_position.y = clampf(global_position.y, 50, 598)

func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		body.bounce_from_paddle(global_position.y, 100)

func get_ai_movement_dir():
	var dist_to_target = abs(ai_target_ypos - global_position.y)
	var accuracy_dist = 25.0
	if (dist_to_target > accuracy_dist):
		if ai_target_ypos > global_position.y:
			return 1
		else:
			return -1
	else:
		return 0
