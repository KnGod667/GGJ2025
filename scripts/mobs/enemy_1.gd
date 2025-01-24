extends Node2D

@export var speed = 600
var player_direction
var direction

func _ready() -> void:
	
	player_direction = $"../Burbuja_player".global_position
	direction = (player_direction - position).normalized()

func _process(delta: float) -> void:
	
	var movement = direction * speed * delta
	
	position += movement


func _on_hit_area_area_entered(area: Area2D) -> void:
	pass # FUNCION DE DANHO
