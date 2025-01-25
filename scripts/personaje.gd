extends CharacterBody2D

var SPEED = 5

func _physics_process(delta: float) -> void:
	
	if $"../Burbuja_player".alive:	 
		position = $"../Burbuja_player".global_position
	else:
		look_at(get_global_mouse_position())
		if position.distance_to(get_global_mouse_position()) > 5:
			velocity = position.direction_to(get_global_mouse_position()) * SPEED
			move_and_collide(velocity)
		if Ui.vida > 0:
			Ui.vida -= 13 * delta
					
func dead():
	pass # Fin del Juego