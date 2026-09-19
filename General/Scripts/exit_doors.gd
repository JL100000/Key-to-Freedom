extends Area2D
@onready var animation_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var animation_1: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
@onready var label_2: Label = $Label2


var  unlock_door: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label_2.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and area_entered and unlock_door == true:
		label.visible = false
		label_2.visible = true
		animation_1.play("unlocked")
		animation_2.play("unlocked")
		TokenManager.unlocked_door = true

	if TokenManager.play_again == 1:
		animation_1.play("unlocked")
		animation_2.play("unlocked")
		label.visible = false
		label_2.visible = true





		


func _on_body_entered(body: Node2D) -> void:
	if TokenManager.have_key == true:
		label.visible = true
		label_2.visible = false
		animation_1.play("interact")
		animation_2.play("interact")
		unlock_door = true
		


func _on_body_exited(body: Node2D) -> void:
	label.visible = false
	label_2.visible = false
	animation_1.play("locked")
	animation_2.play("locked")
