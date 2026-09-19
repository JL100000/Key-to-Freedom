extends Node2D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/main_menu.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/PB_tutorial.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/SQ_tutorial.tscn")


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/PR_tutorial.tscn")


func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/FP_tutorial.tscn")
