extends CharacterBody2D

@export var BURBUJA_SPEED = 10.0
@export var BURBUJA_ACELERACION = 0.1

func _ready() -> void:
	$burbuja_animation.play("IDLE")
	
func _physics_process(delta: float) -> void:
	
	var mouse_direction = get_global_mouse_position()
	
	velocity = position.direction_to(mouse_direction) * BURBUJA_SPEED
	
	if position.distance_to(mouse_direction) > 60:
		
		BURBUJA_SPEED += BURBUJA_ACELERACION * delta
		move_and_collide(velocity)
		
	elif position.distance_to(mouse_direction) > 10:
		
		move_and_collide(velocity * 0.4)
	
	else:
		BURBUJA_SPEED = 15.0
	
