extends Control

var time: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Time_of_Game".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/VBoxContainer/O2_ProgressBar.value = Ui.o2
	$CanvasLayer/VBoxContainer/Vida_ProgressBar.value = Ui.vida
	

func _on_time_of_game_timeout() -> void:
	time += 1
	$CanvasLayer/VBoxContainer2/Time_Label.text = "Time: " + str(time)
