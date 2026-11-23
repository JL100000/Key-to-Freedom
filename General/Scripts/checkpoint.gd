extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
#Just checking any valid bodies to trigger it
	if body.is_in_group("players"):
		#It makes sure the next time you die you span at the globabl position of the checkpoint
		Gamedate.checkpoint = global_position
		Gamedate.has_checkpoint = true
