extends Node2D

@onready var color_rect = $ColorRect
@onready var hud = $HUD

var score = 0
var coins = 0
var lives = 3
var current_color = Color.WHITE

var change_interval = 1.0
var timer = 0.0

func _process(delta):
	timer += delta
	if timer >= change_interval:
		_change_color()
		timer = 0.0

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		if current_color == Color.BLACK:
			score += 1
			coins += 1
			hud.update_score(score)
		else:
			lives -= 1
			hud.update_lives(lives)
			if lives <= 0:
				_game_over()

func _change_color():
	var rand = randi() % 5
	if rand == 0:
		current_color = Color.BLACK
	else:
		current_color = Color(randf(), randf(), randf())
	color_rect.color = current_color

func _game_over():
	SaveData.save_score(score, coins)
	get_tree().change_scene_to_file("res://UI/Leaderboard.tscn")
