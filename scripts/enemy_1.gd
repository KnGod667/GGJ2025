extends Node2D

@export var speed = 400
var player_direction
var direction

func _ready() -> void:
	
	position = Vector2(randf_range(100, 1000), -20)
	

func _process(delta: float) -> void:
	
	position +=  Vector2(0, speed) * delta
	
	if position.y > 680:
		_delete()

func _delete():
	queue_free()


func _on_hit_area_area_entered(area: Area2D) -> void:
	pass # FUNCION DE DANHO
