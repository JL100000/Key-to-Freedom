extends StaticBody2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
var is_player_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global_position in Boxtracker.destroyed_boxes:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_player_inside == true and Input.is_action_just_pressed("interact"):
		Boxtracker.destroyed_boxes.append(global_position)
		#This function here adds the boxes global position to the list and if it is on there next time the arcade respawns it will be ignored
		print("done")
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is arcade_player:
		is_player_inside = true
		animation.play("interact")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is arcade_player:
		is_player_inside = false
		animation.play("default")
