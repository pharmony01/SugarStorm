extends Character

func _process(_delta):
	look_at(get_global_mouse_position())
	


func _on_player_moved(player_new_position):
	pass
	# Calculate direction vector from enemy to player
	# var direction = player.global_position - global_position
	# Normalize the direction vector
	# direction = direction.normalized()
	# Calculate movement vector
	# var movement = direction * speed * delta
		# Move the enemy
	# move_and_slide(movement)
	# calculate the direction of the player using 'player_new_position'
	# and multiply the result with the enemy speed and plug it all in move_and_slide()
