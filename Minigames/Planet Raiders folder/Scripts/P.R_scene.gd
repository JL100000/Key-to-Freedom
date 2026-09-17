extends Node2D
@onready var enemy_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_enemy.tscn")
# Called when the node enters the scene tree for the first time.
var score = 0
@onready var death_screen: CanvasLayer = $DeathScreen
@onready var win_screen_1: CanvasLayer = $WinScreen_1
@onready var win_screen_2: CanvasLayer = $WinScreen_2
@onready var game_ui: Control = $game_ui
@onready var score_label: Label = $game_ui/score_label



func _ready():
	_update_ui()
	TokenManager.enemies_spawning = true
	TokenManager.enemies_shooting = true

func _update_ui():
	$game_ui/score_label.text = "Score: " + str(score)
	if score == 1000:
		if TokenManager.planet_raiders_won == true:
			await get_tree().create_timer(0.75).timeout
			get_tree().call_group("missiles", "queue_free")
			get_tree().paused = true
			if win_screen_1:
				win_screen_1.show()
		elif TokenManager.planet_raiders_won == false:
			await get_tree().create_timer(0.75).timeout
			get_tree().call_group("missiles", "queue_free")
			get_tree().paused = true
			TokenManager.add_tokens(1)
			TokenManager.planet_raiders_won = true
			if win_screen_2:
				win_screen_2.show()
	
func _on_enemy_killed():
	score += 50
	_update_ui()







func _on_pr_enemy_spawn_timeout() -> void:
	if TokenManager.enemies_spawning == true:
		var enemy = enemy_prefab.instantiate()
		var random_y = randi_range(30,610)
		enemy.position = Vector2(1200,random_y)
		enemy.enemy_killed.connect(_on_enemy_killed)
		add_child(enemy)


func _on_pr_player_player_killed() -> void:
	TokenManager.enemies_shooting = false
	TokenManager.enemies_spawning = false
	get_tree().call_group("missiles", "queue_free")
	#get_tree().paused = true
	if death_screen:
		death_screen.show()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://General/Scenes/arcade.tscn")
