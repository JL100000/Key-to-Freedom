extends Area2D
class_name enemy
@export var speed = 3
@onready var explosion_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_explosion.tscn")
@onready var laser_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_enemy_laser.tscn")
signal enemy_killed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed



func _on_area_entered(area: Area2D) -> void:
	if area is laser:
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		enemy_killed.emit()



func _on_enemy_laser_timeout() -> void:
	var laser = laser_prefab.instantiate()
	laser.position = position
	get_parent().add_child(laser)
