extends CharacterBody2D
@export var player: Node2D
@onready var nav_agent: = $NavigationAgent2D as NavigationAgent2D
@onready var sprite = $AnimatedSprite2D
@onready var death_screen: CanvasLayer = $"../DeathScreen"
const speed = 90

func _ready() -> void:
	await get_tree().physics_frame
	await get_tree().physics_frame
	makepath()

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	if velocity.x != 0:
		sprite.flip_h = velocity.x < 0

func makepath() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath()

func _on_navigation_agent_2d_target_reached() -> void:
	get_tree().paused = true
	if death_screen:
		death_screen.show() 
