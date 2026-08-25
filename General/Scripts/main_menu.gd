extends Node2D

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/arcade.tscn")

func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/tutorial.tscn")
