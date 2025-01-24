extends Node2D
var fish 
var rnd : int
var elegido : PathFollow2D

func _ready() -> void:
	fish = preload("res://scenes/mobs/sprite.tscn")
	rnd = randi()%4
	elegido = get_child(rnd).get_child(0)
	elegido.add_child(fish.instantiate())

func _physics_process(delta: float) -> void:
	elegido.progress += 500 *delta
	if elegido.progress_ratio == 1:
		queue_free()
