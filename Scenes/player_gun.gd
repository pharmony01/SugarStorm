extends CharacterBody2D

@export var max_speed: int = 1500
var speed: int = max_speed
var dash_distance: int = 150

func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position
	
	# rotate
	look_at(get_global_mouse_position())
	var player_direction = ((get_global_mouse_position() - position).normalized())
	
	if Input.is_action_just_pressed("shift"):
		set_global_position(Vector2(player_direction.x * dash_distance + Globals.player_pos.x, player_direction.y * dash_distance + Globals.player_pos.y))
