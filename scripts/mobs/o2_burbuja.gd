extends RigidBody2D


func _ready() -> void:
	
	if global_position.x <= 600:
		apply_impulse(Vector2(randf_range(500, 600),0),Vector2.ZERO)
	else:
		apply_impulse(Vector2(randf_range(-600, -500),0),Vector2.ZERO)

		

func delete_():
	queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("BURBUJA"):
		area.get_parent().aumentar_o2(randf_range(0.5,0.7))
	
	
	if area.is_in_group("PLAYER"):
		# >>>>> ANIMACION ABSORCION <<<<<	
		area.get_parent().aumentar_burbuja(randf_range(0.6, 1))
		delete_()
	
	if area.is_in_group("enemy"):
		# >>>>> ANIMACION DE EXPLOTAR <<<<<	
		delete_()

func _on_timer_timeout() -> void:
	delete_()
