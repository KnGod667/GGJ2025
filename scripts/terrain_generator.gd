extends Node

@export var width_min:int
@export var width_max:int
var data :Image
var width
var new_width
var displacement
var new_displacement
var width_interpolation = 0.0
var displacement_interpolation = 0.0
var y_offset = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var res = get_viewport().size
	data = Image.create_empty(res.x,res.y,false,Image.FORMAT_RGBA8)
	width = res.x
	displacement = 0
	new_width = randi_range(width_min,width_max)
	new_displacement = randi_range(0,res.x-new_width)
	var interpolation_rate = 10/res.y
	for y in range(res.y-1,0,-1):
		print(width," ", new_width," ", displacement," ",new_displacement," ",width_interpolation)
		if(width_interpolation>1.0):
			print("lololo")
			width_interpolation = 0
			width=new_width
			displacement = new_displacement
			new_width = randi_range(width_min,width_max)
			new_displacement = randi_range(0,res.x-new_width)
		var d = floor(displacement*(1-width_interpolation)+new_displacement*(width_interpolation))
		var w = floor(width*(1-width_interpolation)+new_width*(width_interpolation))
		for x in d:
			data.set_pixel(x,y,Color(1,0,0))
		for x in range(d,d+w):
			data.set_pixel(x,y,Color(0,1,0))
		for x in range(d+w,res.x):
			data.set_pixel(x,y,Color(1,0,0))
		width_interpolation+=interpolation_rate
		pass
	$TextureRect.texture = ImageTexture.create_from_image(data)
	($ColorRect.material as ShaderMaterial).set_shader_parameter("text",ImageTexture.create_from_image(data))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
