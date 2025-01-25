extends CharacterBody2D

var SPEED = 5
#Vars para el escaneo de colision, aunque las veo algo toscas
var x = 20

func _physics_process(delta: float) -> void:
	if TerrainAdapter.check_area_collision(global_position,x):
		dead()
	if !$Burbuja_player.alive:
		look_at(get_global_mouse_position())
		if global_position.distance_to(get_global_mouse_position()) > 5:
			velocity = global_position.direction_to(get_global_mouse_position()) * SPEED
			move_and_collide(velocity)
		if Ui.vida > 0:
			Ui.vida -= 13 * delta
					
func dead():
	queue_free() # Fin del Juego
