extends Node2D

var timer :Timer = Timer.new() 
var fish_enemy = preload("res://scenes/mobs/fish.tscn")

func _ready() -> void:
	add_child(timer)
	timer.timeout.connect(_timer_timeout)
	timer.start(GlobalVariables.spawn_fish)
	
func crear_enemigo():
	var pos: Vector2 
	var set_rot
	var rand = randi_range(0,3)
	if  rand == 0:
		pos = Vector2(randf_range(100,1000), 600)
		set_rot = 0
	if rand == 1:
		pos = Vector2(randf_range(100,1000), -10)
		set_rot = 180
	if rand == 2:
		pos = Vector2(1150,randf_range(100,600))
		set_rot = -90
	if rand == 3:
		pos = Vector2(0,randf_range(100,600))
		set_rot = 90
	var fish_instantiate = fish_enemy.instantiate()
	fish_instantiate.position = pos
	fish_instantiate.rotation = set_rot
	add_child(fish_instantiate)
		



func _timer_timeout() -> void:
	crear_enemigo()
	
	
