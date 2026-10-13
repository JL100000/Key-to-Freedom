extends Area2D
class_name enemy
@export var speed = 3
@onready var explosion_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_explosion.tscn")
@onready var laser_prefab = preload("res://Minigames/Planet Raiders folder/Prefabs/P.R_enemy_laser.tscn")
signal enemy_killed


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
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
	if TokenManager.enemies_shooting == true:
		var laser_1 = laser_prefab.instantiate()
		laser_1.position = position
		get_parent().add_child(laser_1)
		laser_1.add_to_group("missiles")
