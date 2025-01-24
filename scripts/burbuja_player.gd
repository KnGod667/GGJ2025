extends CharacterBody2D

@export var BURBUJA_SPEED = 10.0
@export var BURBUJA_ACELERACION = 0.1

var alive

func _ready() -> void:
	$burbuja_animation.play("IDLE")
	$AnimatedSprite2D.play("IDLE")
	alive = true
func _physics_process(delta: float) -> void:
	#MOVIMIENTO
	if alive:
		var mouse_direction = get_global_mouse_position()
		
		velocity = position.direction_to(mouse_direction) * BURBUJA_SPEED
		
		if position.distance_to(mouse_direction) > 60:
			
			BURBUJA_SPEED += BURBUJA_ACELERACION * delta
			move_and_collide(velocity)
			
		elif position.distance_to(mouse_direction) > 10:
			
			move_and_collide(velocity * 0.4)
		
		else:
			BURBUJA_SPEED = 15.0
	else:
		position = $"../Personaje".global_position
	
	# o2 de las burbuja
	if Ui.o2 > 0.1:
		scale = Vector2(Ui.o2,Ui.o2)
	elif alive:
		hit_()

func hit_(): # Explotar la burbuja???
	alive = false
	hide()

func aumentar_o2(tamanho: float):
	Ui.o2 += tamanho



	
