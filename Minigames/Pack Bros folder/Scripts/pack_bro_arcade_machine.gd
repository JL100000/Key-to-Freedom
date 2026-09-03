extends Area2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
var is_player_inside: bool = false
@onready var label_2: Label = $Label2


func _ready() -> void:
	label.visible = false
	label_2.visible = false
func _process(delta: float) -> void:
	if is_player_inside == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Minigames/Pack Bros folder/Scenes/pack_bro_scene.tscn")

func _on_area_entered(area: Area2D) -> void:
	is_player_inside = true
	animation.play("interact")
	label.visible = true
	label_2.visible = true
	TokenManager.in_packbro = true
	if area_entered and TokenManager.in_slime_quest:
		is_player_inside = false
		animation.play("idle")
		label.visible = false
		label_2.visible = false

func _on_area_exited(area: Area2D) -> void:
	is_player_inside = false
	animation.play("idle")
	label.visible = false
	label_2.visible = false
	TokenManager.in_packbro = false
