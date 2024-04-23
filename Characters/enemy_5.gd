extends Character

var speed = 25
var target_position
var player_position

func _process(_delta):
	# look_at(get_global_mouse_position())
	pass

func _on_player_position_changed(delta, player_position_function):
	player_position = player_position_function
	target_position = (player_position - position).normalized()
	look_at(player_position)
	
	if position.distance_to(player_position) > 3:
		move_and_collide(target_position * speed * delta)
