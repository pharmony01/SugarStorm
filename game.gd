extends Node2D

#var enemy_scene = preload("res://Characters/enemy_test_test.tscn")
var seconds_since_start = 0
var iterator = 0


func _process(_delta):
	seconds_since_start = (Time.get_ticks_msec() - $"/root/WtfASingleton".time_since_start) / 1000
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
