extends Node

var score = 0
@onready var score_label: Label = $"../TileMaps/ScoreLabel"

func add_point():
	score += 1
	score_label.text = "You got " +str(score)+ " coins!"
