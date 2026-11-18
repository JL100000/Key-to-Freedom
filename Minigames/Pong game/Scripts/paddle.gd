extends Area2D

#const MAX_VELOCITY = 10.0
#var velocity = 0.0
#var acceleration = 50.0
#var up_input = "up"
#var down_input = "down"
func _physics_process(delta: float) -> void:
	#var move_dir = 0.0
	#move_dir = Input.get_axis("up", "down")
	#velocity += move_dir * acceleration * delta
	#if move_dir == 0.0:
		#velocity = move_toward(velocity, 0.0, 2.0)
	#print(velocity)
	#global_position.y += velocity
	pass
func _process(delta: float) -> void:
	if Input.is_action_pressed("up") and position.y > 35:
		position.y -= 5
	if Input.is_action_pressed("down") and position.y < 615:
		position.y += 5
