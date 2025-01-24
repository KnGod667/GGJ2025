extends CharacterBody2D

var SPEED = 5
#Vars para el escaneo de colision, aunque las veo algo toscas
var x = 20
var radio = [Vector2(x, 0),Vector2(-x, 0), 
			Vector2(0, x), Vector2(0, -x), 
			Vector2(x, x), Vector2(-x, x), 
			Vector2(-x, -x), Vector2(x, -x)]

func _physics_process(delta: float) -> void:
	check_Radio(global_position)
	if !$Burbuja_player.alive:
		look_at(get_global_mouse_position())
		if global_position.distance_to(get_global_mouse_position()) > 5:
			velocity = global_position.direction_to(get_global_mouse_position()) * SPEED
			move_and_collide(velocity)
		if Ui.vida > 0:
			Ui.vida -= 13 * delta
					
func dead():
	queue_free() # Fin del Juego

#func para escanear el radio
func check_Radio(position : Vector2):
	for v in radio:
		if TerrainAdapter.is_coliding(position + v):
			dead()
		 
	
