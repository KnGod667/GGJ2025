extends Node

var paused = false
@export var scroll_speed = 120.0

func pause(val):
	paused = val
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
