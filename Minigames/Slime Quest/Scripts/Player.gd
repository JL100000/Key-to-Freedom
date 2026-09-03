extends CharacterBody2D
class_name Player
@onready var death_screen: CanvasLayer = $"../DeathScreen"
@onready var win_screen_2: CanvasLayer = $"../WinScreen_2"
@onready var win_screen_1: CanvasLayer = $"../WinScreen_1"
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer = $jump_sound
@onready var death_sound: AudioStreamPlayer = $death_sound
@onready var explosion = preload("res://Minigames/Slime Quest/Prefabs/slime_quest_explosion.tscn")
@onready var spike_explosion = preload("res://Minigames/Slime Quest/Prefabs/spike_explosion.tscn")
var facing_directon = 1
#The variable controls what direction you shoot in
var start_position = Vector2(559,492)
#Where the player spawns in
var can_move: bool = true
const SPEED = 450.0
const JUMP_VELOCITY = -450.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Handles respawn
	if position.y > 850:
		respawn()
#Ensures the player cannot go below y value of 615 preventing infinite falls
	
	# Handles jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#jump_sound.play()
	if not can_move:
		velocity.x = 0
		velocity.y = 0
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
			animation.play("move")
		else:
			animation.play("idle")
	else:
		animation.play("jump")
#Depending on action this controls all animations
func respawn():
	#death_sound.play()
	var player_explosion = explosion.instantiate()
	player_explosion.position = position
	get_parent().add_child(player_explosion)
	await get_tree().create_timer(0.75).timeout
	get_tree().paused = true
	if death_screen:
		death_screen.show()

#Handles death respawing at start position with all indicaters of death
func respawn_1():
	can_move = false
	var player_explosion_spike = spike_explosion.instantiate()
	player_explosion_spike.position = position
	get_parent().add_child(player_explosion_spike)
	await get_tree().create_timer(1.0).timeout
	get_tree().paused = true
	if death_screen:
		death_screen.show()
		can_move = true
