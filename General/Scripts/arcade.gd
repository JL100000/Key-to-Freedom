extends Node2D
@onready var token_label: Label = $CanvasLayer2/Token_label

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/main_menu.tscn")

func _ready() -> void:
	update_token_display()

func update_token_display() -> void:
	token_label.text = "Tokens: " + str(TokenManager.tokens)
