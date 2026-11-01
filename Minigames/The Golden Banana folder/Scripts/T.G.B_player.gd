extends CharacterBody2D
@onready var death_screen: CanvasLayer = $"../DeathScreen"
@onready var win_screen_2: CanvasLayer = $"../WinScreen_2"
@onready var win_screen_1: CanvasLayer = $"../WinScreen_1"
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
var facing_directon = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	get_tree().paused = false
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Handles respawn
	if position.y > 500:
		respawn()
#Ensures the player cannot go below y value of 615 preventing infinite falls
	
	# Handles jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():

		velocity.y = JUMP_VELOCITY
		#jump_sound.play()

		move_and_slide()
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
		#flip_h is moving left
		if direction < 0:
			animation.flip_h = true
			facing_directon = -1
		else:
			animation.flip_h = false
			facing_directon = 1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#Handles all animations
	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation.play("run")
		else:
			animation.play("idle")
	else:
		animation.play("jump")
#Depending on action this controls all animations
func respawn():
	#death_sound.play()
	get_tree().paused = true
	if death_screen:
		death_screen.show()
