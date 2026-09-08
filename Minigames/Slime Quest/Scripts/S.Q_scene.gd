extends Node2D
@onready var win_screen_1: CanvasLayer = $WinScreen_1
@onready var win_screen_2: CanvasLayer = $WinScreen_2
@onready var death_screen: CanvasLayer = $DeathScreen
@onready var explosion = preload("res://Minigames/Slime Quest/Prefabs/S.Q_explosion.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/arcade.tscn")
