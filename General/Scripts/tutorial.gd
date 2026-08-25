extends Node2D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/main_menu.tscn")
