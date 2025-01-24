extends CharacterBody2D

@export var BURBUJA_SPEED = 10.0
@export var BURBUJA_ACELERACION = 0.1

func _ready() -> void:
	$burbuja_animation.play("IDLE")
	
	
func _physics_process(delta: float) -> void:
	#MOVIMIENTO
	var mouse_direction = get_global_mouse_position()
	
	velocity = position.direction_to(mouse_direction) * BURBUJA_SPEED
	
	if position.distance_to(mouse_direction) > 60:
		
		BURBUJA_SPEED += BURBUJA_ACELERACION * delta
		move_and_collide(velocity)
		
	elif position.distance_to(mouse_direction) > 10:
		
		move_and_collide(velocity * 0.4)
	
	else:
		BURBUJA_SPEED = 15.0
	
	# o2 de las burbuja
	if Ui.o2 > 0.1:
		scale = Vector2(Ui.o2,Ui.o2)

func hit_(): # Explotar la burbuja???
	pass

func restablecer_o2():
	pass
