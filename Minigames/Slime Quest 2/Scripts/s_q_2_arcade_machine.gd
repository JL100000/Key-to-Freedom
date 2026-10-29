extends Area2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
var is_player_inside: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label_2.visible = false
func _process(delta: float) -> void:
	if is_player_inside == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Minigames/Slime Quest 2/Scenes/S.Q.2_scene.tscn")

#Need to change all body entered code to player only
func _on_body_entered(body: Node2D) -> void:
	is_player_inside = true
	animation.play("interact")
	label.visible = true
	label_2.visible = true
	TokenManager.in_slime_quest = true
	if area_entered and TokenManager.in_packbro:
		is_player_inside = false
		animation.play("idle")
		label.visible = false
		label_2.visible = false


func _on_body_exited(body: Node2D) -> void:
	is_player_inside = false
	animation.play("default")
	label.visible = false
	label_2.visible = false
	TokenManager.in_slime_quest = false
