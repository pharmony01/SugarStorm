extends Character

const LASER_SPEED = 1000.0
const GRENADE_SPEED = 500.0

signal position_changed(position)


func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	look_at(get_global_mouse_position())
	# emit_signal("position_changed", self.global_position)
	position_changed.emit(self.global_position)
	
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
	


func _on_position_changed(position):
	pass # Replace with function body.
