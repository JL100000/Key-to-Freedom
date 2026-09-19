extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continue_playing_pressed() -> void:

	TokenManager.unlocked_door = false
	TokenManager.play_again = 1
	hide()
	get_tree().paused = false
	


func _on_play_again_pressed() -> void:

	TokenManager.four_tokens = false
	TokenManager.unlocked_door = false
	TokenManager.tokens = 0
	TokenManager.have_key = false
	TokenManager.FP_score = 0
	TokenManager.in_packbro = false
	TokenManager.in_slime_quest = false
	TokenManager.planet_raiders_won = false
	TokenManager.enemies_shooting= true
	TokenManager.pack_bro_won = false
	TokenManager.slime_quest_won = false
	TokenManager.enemies_spawning = true
	TokenManager.flying_parrot_won = false
	TokenManager.play_again = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://General/Scenes/main_menu.tscn")
