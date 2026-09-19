extends Area2D
@onready var label: Label = $Label
var is_player_inside: bool = false
@onready var label_2: Label = $Label2
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	label.visible = false
	label_2.visible = false
func _process(delta: float) -> void:
	if is_player_inside == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Minigames/Flying Parrot folder/Scenes/F.P_scene.tscn")




func _on_body_entered(body: Node2D) -> void:
	is_player_inside = true
	animation.play("interact")
	label.visible = true
	label_2.visible = true


func _on_body_exited(body: Node2D) -> void:
	is_player_inside = false
	animation.play("idle")
	label.visible = false
	label_2.visible = false
