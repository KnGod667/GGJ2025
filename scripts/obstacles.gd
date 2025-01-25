extends Node2D
#>>>>>>>>>>>>>>>>Esto esta mal, hay que tocarlo pero creo que es una buena idea no se<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

var timer :Timer = Timer.new() 
var gey  =  preload("res://scenes/obstacles/generador.tscn")
var f : Node2D
var geyIns : Node2D
var en_mapa : bool = false
var pos = global_position + Vector2(0, -800)
var pos2 =global_position + Vector2(0, -790)

#Crea un timer para hacer el escaneo cada x tiempo
func _ready() -> void:
	add_child(timer)
	timer.timeout.connect(_timer_timeout)
	timer.start(5)
	
#Al acabar de forma aleatoria escanea o para derecha o para izquierda poquito a poco
func _timer_timeout():
	if !TerrainAdapter.is_coliding(pos):
		geyIns = gey.instantiate()
		if randi()%10 < 5:
			scan(5)
		else:
			scan(-5)

#Escanea en la dir dicha, genera lo que quieras en esa posicion en que detecto colision y reinicia la pos para la sig generacion
func scan(move):
	while !TerrainAdapter.is_coliding(pos) and pos.x<TerrainAdapter.image.get_width() and pos.x>=0:

		pos += Vector2(move, 0)
		pos2 += Vector2(move, 0)
	var pendiente = pendiente(pos, pos2)
	generateObj(pos, pendiente)
	pos = global_position + Vector2(0, -800)

#Esto esta chapucero pero add el objeto al nodo y lo posiciona donde encontro la colision
func generateObj(posGen, pendiente):
	geyIns.rotation = pendiente
	add_child(geyIns)
	f = get_child(get_child_count()-1)
	f.global_position = posGen
	
func pendiente(p, p2):
	return (p.y - p2.y)/(p.x - p2.x)
