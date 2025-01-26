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
	rnd =  randi_range(-300, 300)
	pos = Vector2(rnd, -640)
	if !TerrainAdapter.is_coliding(pos):
		rockIns = rock.instantiate()
		rockIns.position = pos
		add_child(rockIns)
		r = get_child(get_child_count()-1)
		
