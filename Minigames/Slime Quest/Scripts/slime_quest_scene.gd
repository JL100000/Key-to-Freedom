extends Node2D
@onready var win_screen_1: CanvasLayer = $WinScreen_1
@onready var win_screen_2: CanvasLayer = $WinScreen_2
@onready var death_screen: CanvasLayer = $DeathScreen
@onready var explosion = preload("res://Minigames/Slime Quest/Prefabs/slime_quest_explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
