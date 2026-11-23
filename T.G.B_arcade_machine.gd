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
		#The two lines below ensure that previous checkpoints from other affected games are not carried into this one
		Gamedate.has_checkpoint = false
		Gamedate.checkpoint = Vector2.ZERO
		get_tree().change_scene_to_file("res://Minigames/The Golden Banana folder/Scenes/T.G.B_scene.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body is arcade_player:
		is_player_inside = true
		animation.play("interact")
		label.visible = true
		label_2.visible = true



func _on_body_exited(body: Node2D) -> void:
	is_player_inside = false
	animation.play("idle")
	label.visible = false
	label_2.visible = false
