extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("up") and position.y > 170:
		position.y -= 5
	if Input.is_action_pressed("down") and position.y < 625:
		position.y += 5
	if Input.is_action_pressed("right") and position.x < 1131:
		position.x += 5
	if Input.is_action_pressed("left") and position.x > 21:
		position.x -= 5
