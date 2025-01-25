extends Node

var initialized = false
var image:Image
var tg
# Called when the node enters the scene tree for the first time.
func is_coliding(point:Vector2i) -> bool:
	if(!initialized):
		tg = get_tree().root.find_child("TerrainGenerator",true,false)
		image = tg.data;
		if(tg != null):
			initialized = true
		else:
			return false
		pass
	var y = (point.y-tg.y_offset+400)
	if y < 0:
		y+=image.get_height()
	return image.get_pixel(point.x,y).r>0.5

func get_collision_vector(point:Vector2i,radius:int) -> Vector2:
	var base:Vector2 = Vector2i(1,0)*radius
	var rotation = 0.0
	var rotation_limit = PI*2
	var step = PI/3
	var sum = Vector2()
	var count = 0
	while rotation < rotation_limit:
		var rot = Vector2(point)+base.rotated(rotation)
		if is_coliding(rot):
			sum+=rot
			count+=1
		rotation+=step
	if count == 0:
		return Vector2()
	return sum/count
	
func check_area_collision(point:Vector2i,radius:int) -> bool:
	var base:Vector2 = Vector2i(1,0)*radius
	var rotation = 0.0
	var rotation_limit = PI*2
	var step = PI/3
	if is_coliding(point):
		return true
	while rotation < rotation_limit:
		if is_coliding(Vector2(point)+base.rotated(rotation)):
			return true
		rotation+=step
	return false
	
func _ready() -> void:
	pass # Replace with function body.
