extends Area2D

@onready var win_screen_1: CanvasLayer = $"../WinScreen_1"
@onready var win_screen_3: CanvasLayer = $"../WinScreen_3"



signal player_won



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_won.emit()
	
func _on_player_won():
	if TokenManager.slime_quest_won == true:
		get_tree().paused = true
		if win_screen_1:
			win_screen_1.show()
	elif TokenManager.slime_quest_won == false:
		get_tree().paused = true
		TokenManager.add_tokens(1)
		TokenManager.slime_quest_won = true
		if win_screen_3:
			win_screen_3.show()
