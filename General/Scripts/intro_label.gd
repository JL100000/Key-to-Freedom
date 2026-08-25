extends RichTextLabel
@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	fade_in()
	await get_tree().create_timer(2.0).timeout
	fade_out()

func fade_in() -> void:
	anim_player.play("fade_in")

func fade_out() -> void:
	anim_player.play("fade_out")
