extends Area2D
@onready var win_screen_1: CanvasLayer = $"../WinScreen_1"
@onready var win_screen_2: CanvasLayer = $"../WinScreen_2"




func _on_body_entered(body: Node2D) -> void:
	print("yes")
	if TokenManager.the_golden_banana_won == true:
		get_tree().paused = true
		if win_screen_1:
			win_screen_1.show()
	elif TokenManager.the_golden_banana_won == false:
		print("no")
		get_tree().paused = true
		TokenManager.add_tokens(1)
		TokenManager.the_golden_banana_won = true
		if win_screen_2:
			win_screen_2.show()
