extends Node2D
#>>>>>>>>>>>>>>>>Esto esta mal, hay que tocarlo pero creo que es una buena idea no se<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

var timer :Timer = Timer.new() 
var gey  =  preload("res://scenes/obstacles/generador.tscn")
var geyIns
var pos = global_position + Vector2(0, 200)

#Crea un timer para hacer el escaneo cada x tiempo
func _ready() -> void:
	add_child(timer)
	timer.timeout.connect(_timer_timeout)
	timer.start(2)
	

#Al acabar de forma aleatoria escanea o para derecha o para izquierda poquito a poco
func _timer_timeout():
	geyIns = gey.instantiate()
	if randi()%10 < 5:
		scan(5)
	else:
		scan(-5)

#Escanea en la dir dicha, genera lo que quieras en esa posicion en que detecto colision y reinicia la pos para la sig generacion
func scan(move):
	while !TerrainAdapter.is_coliding(pos):
		pos += Vector2(move, 0)
	generateObj(pos)
	pos = global_position + Vector2(0, 200)

#Esto esta chapucero pero add el objeto al nodo y lo posiciona donde encontro la colision
func generateObj(posGen):
	add_child(geyIns)
	var f : Node2D = get_child(1)
	f.global_position = posGen
