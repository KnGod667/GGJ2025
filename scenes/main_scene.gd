extends Node2D
var pantalla : TextureRect
var game 
var decay = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game = get_child(0)
	pantalla = get_child(1).get_child(1).get_child(0)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and GlobalVariables.dead :
		GlobalVariables.reload()
		TerrainAdapter.reload()
		get_tree().reload_current_scene()
	elif event.is_action_pressed("click") and GlobalVariables.paused :
		game.process_mode = PROCESS_MODE_INHERIT
		GlobalVariables.pause(false)
		get_child(1).get_child(1).get_child(2).play("a")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
