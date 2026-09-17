extends Node2D
@onready var token_label: Label = $CanvasLayer2/Token_label
@onready var pack_bro_arcade_machine: Area2D = $Pack_Bro
@onready var slime_quest_arcade_machine: Area2D = $Slime_quest_arcade_machine
@onready var key_label: Label = $CanvasLayer4/key_label

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/main_menu.tscn")

func _ready() -> void:
	token_label.visible = true
	key_label.visible = false
	update_token_display()
	print("--- SCENE DEBUG ---")
	print("Nodes in tree: ", get_tree().get_node_count())
	
func update_token_display() -> void:
	token_label.text = "Tokens: " + str(TokenManager.tokens)

func _process(delta: float) -> void:
	if TokenManager.four_tokens == true:
		token_label.visible = false
		key_label.visible = true
		
