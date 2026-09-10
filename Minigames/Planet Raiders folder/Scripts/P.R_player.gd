extends Area2D
signal player_killed
@onready var laser_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_player_missile.tscn")
@onready var explosion_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_explosion.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("up") and position.y > 35:
		position.y -= 5
	if Input.is_action_pressed("down") and position.y < 615:
		position.y += 5
	if Input.is_action_pressed("right") and position.x < 900:
		position.x += 5
	if Input.is_action_pressed("left") and position.x > 30:
		position.x -= 5
	if Input.is_action_just_pressed("shoot"):
		var laser = laser_prefab.instantiate()
		laser.position = position
		get_parent().add_child(laser)
		laser.add_to_group("missiles")
		#$AudioStreamPlayer.play()


func _on_area_entered(area: Area2D) -> void:
	if area is enemy_laser:
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		player_killed.emit()
