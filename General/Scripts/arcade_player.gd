extends CharacterBody2D
class_name player
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@export var SPEED: float = 300.0

func _physics_process(delta: float) -> void:

	velocity = Vector2.ZERO
	
	
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("down"):
		velocity.y = SPEED
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		
	
	move_and_slide()
	position.y = clamp(position.y, 170, 625)
	position.x = clamp(position.x, 21, 1131)
	
	if velocity.y == 0:
		animation.play("default")
	else:
		animation.play("move")
	
		
