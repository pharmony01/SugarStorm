extends Character

const LASER_SPEED = 1000.0
const GRENADE_SPEED = 500.0

signal position_changed(position)
signal railgun()
var CanDash: bool = true
var CanShoot: bool = true
var HasDied: bool = false
var Invincible: bool = false


func _on_raycast_collision(result):
	if result.size() > 0:
		for i in range(result.size()):
			var collider = result["collider"]
			collider.queue_free()

func _process(delta: float) -> void:
	# var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	look_at(get_global_mouse_position())
	position_changed.emit(delta, position)
	
	# This *might* break so check if dying instantly
	# This *might* break so check if dying instantly
	# This *might* break so check if dying instantly
	# This *might* break so check if dying instantly
	if get_slide_collision_count() > 0 and Invincible == false:
		if HasDied == false:
			Invincible = true
			$"m&mNuke".visible = true
			$HasDiedTimer.start()
			HasDied = true
			for i in $DeathNuke.get_overlapping_bodies():
				if i != $".":
					$"/root/WtfASingleton".enemies_killed += 1
					i.queue_free()
		elif HasDied == true:
			get_tree().change_scene_to_file("res://game_over_screen.tscn")
		
	# for i in get_slide_collision_count():
		# get_tree().quit()
	
	# MEGA TESTING CAUSE BORED
	if position.x < -30:
		position.x = 510
	if position.x > 510:
		position.x = -30
	if position.y < -20:
		position.y = 290
	if position.y > 290:
		position.y = -20
	
	
	
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
	if Input.is_action_pressed("primary") and CanShoot == true:
		railgun.emit()
		CanShoot = false
		$ShootTimer.start()
	if Input.is_action_just_pressed("primary"):
		$GunSound.play()
		$MuzzleFlash.show()
		$MuzzleFlashTimer.start()
	if Input.is_action_just_pressed("secondary"):
		print("Grenade")
	if Input.is_action_just_pressed("dash") and CanDash == true:
		$CanDashTimer.start()
		CanDash = false
		acceleration = 100
		max_speed = 300
		$DashTimer.start()


func _on_dash_timer_timeout():
	acceleration = 40
	max_speed = 100


func _on_can_dash_timer_timeout():
	CanDash = true


func _on_muzzle_flash_timer_timeout():
	$MuzzleFlash.hide()


func _on_shoot_timer_timeout():
	CanShoot = true

func wtf():
	print("5")


func _on_has_died_timer_timeout():
	Invincible = false
