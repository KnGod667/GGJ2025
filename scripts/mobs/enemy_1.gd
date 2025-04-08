extends Node2D

@export var speed = 600
var player : CharacterBody2D 
var player_direction
var direction


func _ready() -> void:
	$Sprite2D.play("default")

func _process(delta: float) -> void:
	if position.y <= get_viewport().size.y+100:
		var col = TerrainAdapter.get_collision_vector(global_position, 20)
		if col != Vector2.ZERO:
			direction = -col
			position += (delta*speed)*direction
		position.y += delta * speed
	else:
		queue_free()


func _on_hit_area_area_entered(area: Area2D) -> void:
	pass # FUNCION DE DANHO
