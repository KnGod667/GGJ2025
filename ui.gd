extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/VBoxContainer/O2_ProgressBar.value = Ui.o2
	$CanvasLayer/VBoxContainer/Vida_ProgressBar.value = Ui.vida
	$CanvasLayer/VBoxContainer2/Time_Label.text = "Time: " + str(Time.get_ticks_msec()/1000)
