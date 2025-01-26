extends Node2D

@export var speed = 600
var player : CharacterBody2D 
var player_direction
var direction

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.y += delta * speed
	if position.y > 648:
		queue_free()


func _on_hit_area_area_entered(area: Area2D) -> void:
	pass # FUNCION DE DANHO
