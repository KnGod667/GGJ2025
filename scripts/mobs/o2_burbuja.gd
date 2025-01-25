extends RigidBody2D


func _ready() -> void:
	
	if global_position.x <= 600:
		apply_impulse(Vector2(randf_range(500, 600),0),Vector2.ZERO)
	else:
		apply_impulse(Vector2(randf_range(-600, -500),0),Vector2.ZERO)

		

func delete_():
	queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # hit_ funcion


func _on_timer_timeout() -> void:
	delete_()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
