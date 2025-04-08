extends Control
var varia = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalVariables.dead and !varia:
		$CanvasLayer2/AnimationPlayer.play("b")
		varia = true
	$CanvasLayer/VBoxContainer/O2_ProgressBar.value = GlobalVariables.o2
	$CanvasLayer/VBoxContainer/Vida_ProgressBar.value = GlobalVariables.vida
	$CanvasLayer/VBoxContainer/Time_Label.text = "Time: " + str(floor(GlobalVariables.score))
