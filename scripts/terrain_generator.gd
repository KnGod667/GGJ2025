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
var y_offset = 0
var res
var w_interpolation_rate
var d_interpolation_rate
	
var d
var w

func linear_interpolation(val1:float,val2:float,x:float)->float:
	return val1*(1-x)+val2*(x)

func cuadratic_interpolation(val1:float,val2:float,x:float)->float:
	return val1*(1-x*x)+val2*(x*x)

func generate_row():
	var y = res.y - y_offset-1
	if y < 0:
		y = res.y-1
		y_offset = 0
	
	for x in d:
		data.set_pixel(x,y,Color(1,0,0))
	for x in range(d,min(d+w,res.x)):
		data.set_pixel(x,y,Color(0,1,0))
	for x in range(d+w,res.x):
		data.set_pixel(x,y,Color(1,0,0))
	width_interpolation+=w_interpolation_rate
	displacement_interpolation+=d_interpolation_rate
		
	if(width_interpolation>1.0):
		width_interpolation = 0.0
		width=new_width
		new_width = randi_range(width_min,width_max)
		w_interpolation_rate = 1.0/(2*abs(width-new_width))

	if(displacement_interpolation>1.0):
		displacement_interpolation = 0.0
		displacement = new_displacement
		new_displacement = randi_range(0,res.x-new_width)
		d_interpolation_rate = 1.0/(2*abs(displacement-new_displacement))

	d = floor(cuadratic_interpolation(displacement,new_displacement,displacement_interpolation))
	w = floor(cuadratic_interpolation(width,new_width,width_interpolation))
	y_offset+=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	res = get_viewport().size
	
	data = Image.create_empty(res.x,res.y,false,Image.FORMAT_R8)
	width = res.x
	displacement = 0
	new_width = randi_range(width_min,width_max)
	new_displacement = randi_range(0,res.x-new_width)
	w_interpolation_rate = 1.0/(2*abs(width-new_width))
	d_interpolation_rate = 1.0/(2*abs(displacement-new_displacement))
	
	d = floor(cuadratic_interpolation(displacement,new_displacement,displacement_interpolation))
	w = floor(cuadratic_interpolation(width,new_width,width_interpolation))
		
	for y in range(res.y-1,0,-1):
		generate_row()
	($ColorRect.material as ShaderMaterial).set_shader_parameter("text",ImageTexture.create_from_image(data))
	pass # Replace with function body.

@export var scroll_speed = 60.0
var scroll = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !GlobalVariables.paused:
		scroll+=delta*scroll_speed
	if(scroll>1):
		scroll -= 1.0
		generate_row()
		($ColorRect.material as ShaderMaterial).set_shader_parameter("text",ImageTexture.create_from_image(data))
		($ColorRect.material as ShaderMaterial).set_shader_parameter("y_offset",y_offset)
		pass
	pass
