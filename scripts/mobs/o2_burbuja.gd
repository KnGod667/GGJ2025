extends RigidBody2D


func _ready() -> void:
	
	#cambiar variable respecto a la inclinacion
	if position.x < 500:
		apply_impulse(Vector2(randf_range(230, 290),-80),Vector2.ZERO)
	else:
		apply_impulse(Vector2(randf_range(-290, -230),-80),Vector2.ZERO)

		
func _process(delta: float) -> void: 
	
	if position.y > 680:
		delete_()
	if gravity_scale < 1:
		gravity_scale += 0.3 * delta

func delete_():
	queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # hit_ funcion
