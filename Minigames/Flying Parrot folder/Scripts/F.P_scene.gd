extends Node2D
@onready var win_screen_1: CanvasLayer = $WinScreen_1
@onready var win_screen_2: CanvasLayer = $WinScreen_2
@onready var win_screen: CanvasLayer = $WinScreen
@onready var tubes: PackedScene = preload("res://Minigames/Flying Parrot folder/Prefabs/F.P_tubes.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TokenManager.FP_score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Control/Label.text = "SCORE: " + str(TokenManager.FP_score)
	if TokenManager.FP_score == 1000:
		if TokenManager.flying_parrot_won == true:
			get_tree().paused = true
			if win_screen_1:
				win_screen_1.show()
		if TokenManager.flying_parrot_won == false:
			get_tree().paused = true
			TokenManager.add_tokens(1)
			TokenManager.flying_parrot_won = true
			if win_screen:
				win_screen.show()


func _on_timer_timeout() -> void:
	var tubesInstance = tubes.instantiate()
	tubesInstance.position.x = 1280
	tubesInstance.position.y = randi_range(-230,56)
	add_child(tubesInstance)
	$Timer.start()
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/arcade.tscn")
