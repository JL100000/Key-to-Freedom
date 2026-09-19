extends Area2D
@onready var animation: AnimatedSprite2D = $Prize_counter
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
var player_is_in_key_range: bool = false
@onready var label_3: Label = $Label3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label_2.visible = false
	label_3.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_action_just_pressed("interact") and player_is_in_key_range:
		if TokenManager.tokens == 4:
			label.visible = false
			label_2.visible = false
			label_3.visible = true
			TokenManager.four_tokens = true
			TokenManager.have_key = true









func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("hi")
		animation.play("interact")
		player_is_in_key_range = true
		if TokenManager.tokens == 4:
			if TokenManager.have_key == true:
				label.visible = false
				label_2.visible = false
				label_3.visible = true
			else:
				label.visible = true
				label_2.visible = false
				label_3.visible = false

		elif TokenManager.tokens < 4:
			label.visible = false
			label_2.visible = true
			label_3.visible = false



func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		animation.play("idle")
		label.visible = false
		label_2.visible = false
		label_3.visible = false
		player_is_in_key_range = false
