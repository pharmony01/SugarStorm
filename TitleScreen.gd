extends Control



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_button_mouse_entered():
	$StartButton.scale = Vector2(1.35, 1.35)
	
func _on_start_button_mouse_exited():
	$StartButton.scale = Vector2(1, 1)


func _on_quit_button_mouse_entered():
	$QuitButton.scale = Vector2(1.35, 1.35)


func _on_quit_button_mouse_exited():
	$QuitButton.scale = Vector2(1, 1)
