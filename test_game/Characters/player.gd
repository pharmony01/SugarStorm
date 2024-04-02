extends Character

const LASER_SPEED = 1000.0
const GRENADE_SPEED = 500.0

func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	look_at(get_global_mouse_position())
	
func get_input() -> void:
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("move_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		mov_direction += Vector2.RIGHT
	if Input.is_action_pressed("move_up"):
		mov_direction += Vector2.UP
	if Input.is_action_just_pressed("primary"):
		print("Shoot")
	if Input.is_action_just_pressed("secondary"):
		print("Grenade")
	
