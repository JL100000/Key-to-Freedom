extends CharacterBody2D

@onready var death_screen: CanvasLayer = $"../DeathScreen"
var gravity : float = 981
var jumpforce : float = 400

func _physics_process(delta: float) -> void:
	if position.y > 650 or position.y < 20:
		get_tree().paused = true
		if death_screen:
			death_screen.show() 
	velocity.y += gravity * delta
	move_and_slide()
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jumpforce
