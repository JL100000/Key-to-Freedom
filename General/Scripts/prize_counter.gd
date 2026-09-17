extends Area2D
@onready var animation: AnimatedSprite2D = $Prize_counter
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
var player_is_in_key_range: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label_2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_is_in_key_range:
		if TokenManager.tokens == 4:
			TokenManager.four_tokens = true
	














func _on_area_entered(area: Area2D) -> void:
	animation.play("interact")
	player_is_in_key_range = true
	if TokenManager.tokens == 4:
		label.visible = true
		label_2.visible = false
	elif TokenManager.tokens < 4:
		label.visible = false
		label_2.visible = true


func _on_area_exited(area: Area2D) -> void:
	animation.play("idle")
	label.visible = false
	label_2.visible = false
	player_is_in_key_range = false
