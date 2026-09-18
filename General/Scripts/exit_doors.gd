extends Area2D
@onready var animation_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var animation_1: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
var unlocked_door: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and area_entered and TokenManager.have_key == true:
		animation_1.play("unlocked")
		animation_2.play("unlocked")
		unlocked_door = true
	if unlocked_door == true:
		animation_1.play("unlocked")
		animation_2.play("unlocked")
#it unlocks as soon as I get the key - need to fix

func _on_area_entered(area: Area2D) -> void:
	if TokenManager.have_key == true:
		label.visible = true
		animation_1.play("interact")
		animation_2.play("interact")
		

func _on_area_exited(area: Area2D) -> void:
	label.visible = false
	animation_1.play("locked")
	animation_2.play("locked")
