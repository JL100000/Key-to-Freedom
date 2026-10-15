extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var speed = 1.9

func _physics_process(delta: float) -> void:
	#ensures that travelling dioagonally does not add extra speed by changing speed using speed/1.3 and changing back to normal speed while running straight
	if (Input.is_action_pressed("up") or Input.is_action_pressed("down")) and (Input.is_action_pressed("right") or Input.is_action_pressed("left")):
		speed = 1.35
	else:
		speed = 1.9
	move_and_slide()
	
	if Input.is_action_pressed("up"):
		position.y -= speed
	if Input.is_action_pressed("down"):
		position.y += speed
	if Input.is_action_pressed("right"):
		position.x += speed
		#flips the animation making it seem clean
		sprite.flip_h = false
	if Input.is_action_pressed("left"):
		position.x -= speed
		#Reflips the animation making it seem super cleam
		sprite.flip_h = true
	if Input.is_action_pressed("up") or Input.is_action_pressed("down") or Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		#Ensures the move animation is played while moving otherwise the idle animation will play
		sprite.play("move")
	else:
		sprite.play("default")
 
