extends Control

var enemies_killed = 0

# Preload the images for rating players
var one_star = preload("res://Art/one_star.png")
var two_star = preload("res://Art/two_star.png")
var three_star = preload("res://Art/three_star.png")
var four_star = preload("res://Art/four_star.png")
var five_star = preload("res://Art/five_star.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	# How long the player lived
	var survival_time = Time.get_ticks_msec() / 1000
	
	# Format text for final screen
	var lived = "You survived for 0d 0h %sm %ss" % [survival_time / 60, survival_time % 60]
	var killed = "You killed %s enemies!" % $"/root/WtfASingleton".enemies_killed
	
	# Set the text for the 2 labels
	$TimeLived.set_text(lived)
	$EnemiesKilled.set_text(killed)
	
	########################
	# NEEDS TO BE ADJUSTED #
	########################
	# Sets the amount of "stars" the player earned by criteria
	if survival_time < 15:
		$Stars.set_texture(one_star)
	else:
		$Stars.set_texture(three_star)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_button_mouse_entered():
	$ContinueButton.scale = Vector2(1.35, 1.35)


func _on_continue_button_mouse_exited():
	$ContinueButton.scale = Vector2(1, 1)


func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")
