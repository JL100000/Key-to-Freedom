extends Node2D
@onready var win_screen: CanvasLayer = $WinScreen
@onready var win_timer: Timer = $Win_timer
@onready var win_screen_1: CanvasLayer = $WinScreen_1

func _ready() -> void:
	await get_tree().physics_frame
	await get_tree().physics_frame
	win_timer.start()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/arcade.tscn")

func _on_win_timer_timeout() -> void:
	if TokenManager.pack_bro_won == true:
		get_tree().paused = true
		if win_screen_1:
			win_screen_1.show()
	if TokenManager.pack_bro_won == false:
		get_tree().paused = true
		TokenManager.add_tokens(1)
		TokenManager.pack_bro_won = true
		if win_screen:
			win_screen.show()
