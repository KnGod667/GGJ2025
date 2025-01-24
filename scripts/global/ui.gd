extends Node

var vida
var o2 : float 

func _ready() -> void:
	vida = 100
	o2 = 1

func _process(delta: float) -> void:
	if o2 > 0:
		o2 -= 0.1 * delta
	
