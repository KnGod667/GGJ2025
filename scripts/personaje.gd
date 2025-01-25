extends CharacterBody2D

@export var SPEED = 5.0
#Vars para el escaneo de colision, aunque las veo algo toscas
var x = 20

var live = true

func _ready() -> void:
	$BubblePrueba.play("default")
	
	
func _physics_process(delta: float) -> void:
	if live:
		look_at(get_global_mouse_position())
	else:
		velocity = Vector2(0,1) * SPEED * 0.5
		move_and_collide(velocity)
	
	if GlobalVariables.vida <= 0 and live:
		dead()
	
	if !$Burbuja_player.alive and live:
		
		var col = TerrainAdapter.get_collision_vector(global_position,x)
		if col!=Vector2():
			move_and_collide(-col*SPEED)
			pass
		if global_position.distance_to(get_global_mouse_position()) > 5 and col==Vector2.ZERO:
			velocity = global_position.direction_to(get_global_mouse_position()) * SPEED
			move_and_collide(velocity)

func dead():
	live = false
	$BubblePrueba.play("dead")
	$CPUParticles2D.gravity = Vector2(0,-1000)
	$CPUParticles2D.position = position
	$PointLight2D.hide()
	GlobalVariables.dead = true
	GlobalVariables.paused = true

func hit_():
	GlobalVariables.vida -= 10
	if GlobalVariables.vida <= 0 and live:
		dead()

func aumentar_burbuja(tamanho:float):
	$Burbuja_player.aumentar_o2(tamanho)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") and !$Burbuja_player.alive:
		hit_()
	if area.is_in_group("enemy") and $Burbuja_player.alive:
		$Burbuja_player.hit_()
