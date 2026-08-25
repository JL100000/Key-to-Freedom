extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	move_and_slide()
	if velocity.x != 0:
		sprite.flip_h = velocity.x < 0
	if Input.is_action_pressed("up"):
		position.y -= 1.5
	if Input.is_action_pressed("down"):
		position.y += 1.5
	if Input.is_action_pressed("right"):
		position.x += 1.5
	if Input.is_action_pressed("left"):
		position.x -= 1.5
