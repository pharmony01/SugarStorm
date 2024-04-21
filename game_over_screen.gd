extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var survival_time = Time.get_ticks_msec() / 1000
	var lived = "You survived for 0d 0h %sm %ss" % [survival_time / 60, survival_time % 60]
	$TimeLived.set_text(lived)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_button_mouse_entered():
	$ContinueButton.scale = Vector2(1.35, 1.35)


func _on_continue_button_mouse_exited():
	$ContinueButton.scale = Vector2(1, 1)


func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")
