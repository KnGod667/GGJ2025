extends Node2D

var bubble = preload("res://scenes/mobs/o2_burbuja.tscn")
var scroll = 0.0

func _process(delta: float) -> void:
	$Timer.wait_time = randf_range(6,9)
	scroll+=delta*GlobalVariables.scroll_speed
	if scroll > 1.0:
		scroll-=1.0
		position.y+=1
	if position.y > 648:
		queue_free()

func _on_timer_timeout() -> void:
	var bubbleins = bubble.instantiate()
	bubbleins.position = position
	get_parent().add_child(bubbleins)
