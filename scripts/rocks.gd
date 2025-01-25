extends Node2D
var timerR : Timer = Timer.new()
var rock = preload("res://scenes/mobs/enemy_1.tscn")
var rockIns : Node2D
var r : Node2D
var rnd 
var pos 

func _ready() -> void:
	add_child(timerR)
	timerR.timeout.connect(_r_timer_timeout)
	timerR.start(0.5)


func _r_timer_timeout():
	rnd =  randi_range(0,get_viewport().size.x)
	pos = Vector2(rnd, -200)
	if !TerrainAdapter.check_area_collision(pos, 5):
		rockIns = rock.instantiate()
		rockIns.position = pos
		add_child(rockIns)
		
