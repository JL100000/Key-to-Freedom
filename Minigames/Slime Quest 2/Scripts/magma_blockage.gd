extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_magma_lever_activated_1() -> void:
	queue_free()


func _on_magma_lever_2_activated_1() -> void:
	queue_free()


func _on_magma_lever_3_activated_1() -> void:
	queue_free()
