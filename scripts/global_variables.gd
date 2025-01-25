extends Node

var paused = false
var max = 20
@export var scroll_speed = 120.0
@export var life_loss_rate = 1
@export var o2_loss_rate = 0.05

@export var vida = 100.0
@export var o2 = 1.0 
@export var spawn_fish = 3
@export var spawn_rock = 2


func pause(val):
	paused = val
	
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Time.get_ticks_msec()/1000 == max:
		max += 10
		spawn_fish -= 0.5
		spawn_rock -= 0.5
	if o2 > 0:
		o2 -= o2_loss_rate * delta
	else:
		vida -=life_loss_rate*delta
	spawn_rock = Time.get_ticks_msec()/1000
	
