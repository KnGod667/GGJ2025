extends CharacterBody2D

@export var SPEED = 5.0
#Vars para el escaneo de colision, aunque las veo algo toscas
var x = 20

func _physics_process(delta: float) -> void:
	if !$Burbuja_player.alive:
		look_at(get_global_mouse_position())
		var col = TerrainAdapter.get_collision_vector(global_position,x)
		print(col)
		if col!=Vector2.ZERO:
			modulate = Color(1,0,1)
			move_and_collide(-col*SPEED)
		else:
			modulate = Color(col.x,col.y,0.5)
			pass
		if global_position.distance_to(get_global_mouse_position()) > 5 and col==Vector2.ZERO:
			velocity = global_position.direction_to(get_global_mouse_position()) * SPEED
			move_and_collide(velocity)

func dead():
	pass
	#queue_free() # Fin del Juego

func hit_():
	Ui.vida -= 10
	if Ui.vida <= 0:
		dead()

func aumentar_burbuja(tamanho:float):

	$Burbuja_player.aumentar_o2(tamanho)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") and !$Burbuja_player.alive:
		hit_()
	if area.is_in_group("enemy") and $Burbuja_player.alive:
		$Burbuja_player.hit_()
