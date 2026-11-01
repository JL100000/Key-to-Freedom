extends Area2D
@onready var win_screen_1: CanvasLayer = $"../WinScreen_1"
@onready var win_screen_2: CanvasLayer = $"../WinScreen_2"
signal player_won

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("won")
	player_won.emit()
		




func _on_player_won() -> void:
	if TokenManager.slime_quest_won == true:
		get_tree().paused = true
		if win_screen_1:
			win_screen_1.show()
	elif TokenManager.slime_quest_won == false:
		get_tree().paused = true
		TokenManager.add_tokens(1)
		TokenManager.slime_quest_won = true
		if win_screen_2:
			win_screen_2.show()
