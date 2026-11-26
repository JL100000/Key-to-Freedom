extends Node2D
@onready var ball = $ball
@onready var paddle_one = $paddle_one
@onready var paddle_two = $paddle_two
@onready var detector_left = $detectorleft
@onready var detector_right = $detectorright
@onready var start_delay = $startdelay
@onready var hud = $CanvasLayer/HUD
@onready var win_screen_1: CanvasLayer = $WinScreen_1
@onready var win_screen_2: CanvasLayer = $WinScreen_2
@onready var l2d = $ballmovementLine2D
@onready var death_screen: CanvasLayer = $DeathScreen
@export var final_score = 3
@onready var lose_screen: CanvasLayer = $LoseScreen

var score = Vector2i.ZERO
var game_area_size = Vector2(1152, 648)

func _ready() -> void:
	detector_left.ball_out.connect(_on_detector_ball_out)
	detector_right.ball_out.connect(_on_detector_ball_out)
	ball.bounced.connect(_on_ball_bounced)
	randomize()
	reset_round()

func _draw() -> void:
	var line_start = Vector2(game_area_size.x/2.0, 0)
	var line_end = Vector2(game_area_size.x/2.0, game_area_size.y)
	draw_dashed_line(line_start, line_end, Color.WHITE, 8.0, 12.0)
func _process(delta: float) -> void:
	if Input.is_action_pressed("ball_control"):
		ball.debug_mode = !ball.debug_mode
		paddle_one.active = !ball.debug_mode
		if !ball.debug_mode:
			ball.move_dir = Vector2(-1, 0)

func reset_game():
	if score.x == 3:
		if TokenManager.pong_game_won == true:
			get_tree().paused = true
			if win_screen_1:
				win_screen_1.show()
		elif TokenManager.pong_game_won == false:
			get_tree().paused = true
			TokenManager.add_tokens(1)
			TokenManager.pong_game_won = true
			if win_screen_2:
				win_screen_2.show()
	if score.y == 3:
		get_tree().paused = true
		if lose_screen:
			lose_screen.show()
	score = Vector2i.ZERO
	hud.reset_score()
	reset_round()

func reset_round():
	var reset_pos = game_area_size / 2.0
	ball.reset(reset_pos)
	start_delay.start()
	await start_delay.timeout
	ball.active = true
	simulate_ball_movement()

func _on_detector_ball_out(is_left):
	if is_left:
		score.y +=1 # right scored
	else:
		score.x += 1 # left scored
	hud.set_new_score(score)
	l2d.clear_points()
	if score.x >= final_score || score.y >= final_score:
		reset_game()
	else:
		reset_round()

func update_l2d(points):
	l2d.clear_points()
	l2d.global_position = ball.global_position
	for point in points:
		var localized_point = l2d.to_local(point)
		l2d.add_point(localized_point)

func _on_ball_bounced():
	simulate_ball_movement()

func simulate_ball_movement(seconds: float = 3.0):
	var ball_pos = ball.global_position
	var move_dir_copy = ball.move_dir
	var bs = ball.get_size()
	var top_limit = bs.y / 2.0
	var bottom_limit = game_area_size.y - (bs.y / 2.0)
	var left_limit = paddle_one.global_position.x + (bs.x / 2.0)
	var right_limit = paddle_two.global_position.x - (bs.x / 2.0)
	var points = [ball_pos]
	var dt = get_physics_process_delta_time()
	for i in range(0, 60 * seconds):
		ball_pos += move_dir_copy * ball.speed * dt
		if ball_pos.x <= left_limit || ball_pos.x >= right_limit:
			if (ball_pos.x <= left_limit) && (move_dir_copy.x > 0):
				pass
			elif (ball_pos.x >= right_limit) && (move_dir_copy.x < 0):
				pass
			else:
				break
		if ball_pos.y <= top_limit || ball_pos.y >= bottom_limit:
			move_dir_copy.y *= -1
			points.append(ball_pos)

	points.append(ball_pos)
	if paddle_one.is_ai:
		paddle_one.ai_target_ypos = ball_pos.y
	if paddle_two.is_ai:
		paddle_two.ai_target_ypos = ball_pos.y
	update_l2d(points)
