extends Node

var initialized = false
var image:Image
var tg
# Called when the node enters the scene tree for the first time.
func is_coliding(point:Vector2i) -> bool:
	if(!initialized):
		tg = get_tree().root.find_child("TerrainGenerator",true,false)
		image = tg.data;
		print(tg,", ",image)
		if(tg != null):
			initialized = true
		else:
			return false
		pass
	var y = (point.y-tg.y_offset)
	if y < 0:
		y+=image.get_height()
	
	return image.get_pixel(point.x,y).r>0.5

func _ready() -> void:
	pass # Replace with function body.
