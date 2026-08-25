extends CanvasLayer

func _ready() -> void:
	hide()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://General/Scenes/arcade.tscn")


func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
