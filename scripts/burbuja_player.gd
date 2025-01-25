extends CharacterBody2D

signal bubble_alive_state_changed
@export var BURBUJA_MAX_SPEED = 10.0
@export var BURBUJA_ACELERACION = 0.1
var speed = 0.0
var alive

func _ready() -> void:
	$burbuja_animation.play("IDLE")
	$AnimatedSprite2D.play("IDLE")
	alive = true
func _physics_process(delta: float) -> void:
	#MOVIMIENTO
	
	if alive:
		var mouse_direction = get_global_mouse_position()
		if global_position.distance_to(mouse_direction) > 60:
			speed = min(speed+BURBUJA_ACELERACION * delta,BURBUJA_MAX_SPEED)
		elif global_position.distance_to(mouse_direction) > 10:
			speed=min(speed+BURBUJA_ACELERACION*0.4*delta,BURBUJA_MAX_SPEED)
		else:
			speed = min(0.1,speed-BURBUJA_ACELERACION*delta)
		
		velocity = global_position.direction_to(mouse_direction) * speed
		
		get_parent().move_and_collide(velocity)
	
	# o2 de las burbuja
	if Ui.o2 > 0.1:
		scale = Vector2(Ui.o2,Ui.o2)
	elif alive:
		hit_()

func hit_(): # Explotar la burbuja???
	alive = false
	hide()
	emit_signal("bubble_alive_state_changed",alive)

func aumentar_o2(tamanho: float):
	Ui.o2 += tamanho
