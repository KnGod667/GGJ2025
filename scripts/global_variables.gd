extends Node

var paused = true
var max = 20
var dead = false
@export var scroll_speed = 120.0
@export var life_loss_rate = 1
@export var o2_loss_rate = 0.05

@export var vida = 1.0
@export var o2 = 1.0 
@export var spawn_fish = 2
@export var spawn_rock = 1
var score = 0.0

func pause(val):
	paused = val

func reload():
	vida = 1.0
	o2 = 1.0 
	spawn_fish = 2
	spawn_rock = 1
	score = 0.0
	dead = false
	max = 20
	paused = true

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if !paused:
		score+=delta
		if floor(score) == max:
			max += 5
			spawn_fish -= 0.2
			spawn_rock -= 0.2
		if o2 > 0:
			o2 -= o2_loss_rate * delta
		else:
			vida -=life_loss_rate*delta
