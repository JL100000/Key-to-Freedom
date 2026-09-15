extends Node2D
var speed : float = 250
@onready var death_screen: CanvasLayer = $"../DeathScreen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position.x -= speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().paused = true
	if death_screen:
			death_screen.show() 




func _on_score_body_exited(body: Node2D) -> void:
	TokenManager.FP_score +=100
