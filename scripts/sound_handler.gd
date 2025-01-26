extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_scene_game_started() -> void:
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_personaje_character_died() -> void:
	$AudioStreamPlayer.stop()
	var rand = randi()%100
	if rand > 80:
		if rand > 90:
			$AudioStreamPlayer4.play()
		else:
			$AudioStreamPlayer2.play()
	else:
		$AudioStreamPlayer3.play()
	pass # Replace with function body.


func _on_personaje_bubble_popped() -> void:
	$pop.play()
	pass # Replace with function body.


func _on_main_scene_clicked() -> void:
	$click.play()
	pass # Replace with function body.
