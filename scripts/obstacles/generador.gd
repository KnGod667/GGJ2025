extends Node2D

var bubble = preload("res://scenes/mobs/o2_burbuja.tscn")

func _on_timer_timeout() -> void:
	var bubbleins = bubble.instantiate()
	add_child(bubbleins)
