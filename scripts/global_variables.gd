extends Node

var paused = false
@export var scroll_speed = 120.0
@export var life_loss_rate = 1
@export var o2_loss_rate = 0.1

@export var vida = 100.0
@export var o2 = 1.0 


func pause(val):
	paused = val
	
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if o2 > 0:
		o2 -= o2_loss_rate * delta
	else:
		vida -=life_loss_rate*delta
	
