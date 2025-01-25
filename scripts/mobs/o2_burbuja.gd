extends RigidBody2D


func _ready() -> void:
	
	#cambiar variable respecto a la inclinacion
	if position.x < 500:
		
		apply_impulse(Vector2(randf_range(230, 290),0),Vector2.ZERO)
	else:
		apply_impulse(Vector2(randf_range(-290, -230),0),Vector2.ZERO)

		

func delete_():
	queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # hit_ funcion


func _on_timer_timeout() -> void:
	delete_()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
