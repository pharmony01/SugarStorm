extends Node2D

#var enemy_scene = preload("res://Characters/enemy_test_test.tscn")
var seconds_since_start = 0
var iterator = 0


func _process(_delta):
	seconds_since_start = (Time.get_ticks_msec() - $"/root/WtfASingleton".time_since_start) / 1000
	print(seconds_since_start)
	iterator = iterator + 1
	if seconds_since_start < 10:
		if iterator % 25 == 0:
			$Spawner.spawn_enemy()
	elif seconds_since_start < 20:
		if iterator % 10 == 0:
			$Spawner.spawn_enemy()
	else:
		$Spawner.spawn_enemy()
	

func _ready():
	#var enemy = enemy_scene.instantiate()
	#var spawn_markers = $EnemyLocations.get_children()
	#var selected_spawn = spawn_markers[randi() % spawn_markers.size()]
	##enemy.position = selected_spawn.global_position
	##add_child(enemy)
	#$Enemy.position = selected_spawn.global_position
	#for n in 10000:
		#selected_spawn = spawn_markers[randi() % spawn_markers.size()]
		#if selected_spawn.global_position != $Enemy.position:
			#break
	#$Enemy2.position = selected_spawn.global_position
	$"/root/WtfASingleton".time_since_start = Time.get_ticks_msec()
	$"/root/WtfASingleton".enemies_killed = 0
	$Player.connect("railgun", self.delete_things)
	
	
#func _physics_process(delta):
	#var player = $Player
	#var space_state: PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
	#var query: PhysicsRayQueryParameters2D = PhysicsRayQueryParameters2D.create(player.position, player.position + (get_global_mouse_position() - player.position).normalized() * 1000)
	#query.exclude=[player]
	#var result: Dictionary = space_state.intersect_ray(query)
			
	
func delete_things():
	var player = $Player
	var space_state: PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
	var query: PhysicsRayQueryParameters2D = PhysicsRayQueryParameters2D.create(player.position, player.position + (get_global_mouse_position() - player.position).normalized() * 1000)
	query.exclude=[player]
	var result: Dictionary = space_state.intersect_ray(query)
	if result.size() > 0:
		$"/root/WtfASingleton".enemies_killed += 1
		for j in range(result.size()):
			var collider = result["collider"]
			collider.queue_free()


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play() # Replace with function body.
