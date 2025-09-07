extends Control

@onready var score_label = $ScoreLabel
@onready var lives_label = $LivesLabel
@onready var coins_label = $CoinsLabel

func update_score(value):
	score_label.text = "Score: %d" % value

func update_lives(value):
	lives_label.text = "Lives: %d" % value

func update_coins(value):
	coins_label.text = "Coins: %d" % value
