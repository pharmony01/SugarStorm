extends Node2D

#var enemy_scene = preload("res://Characters/enemy_test_test.tscn")
var i = 0

func _process(_delta):
	i = i + 1
	if i % 25 == 0:
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
		for j in range(result.size()):
			var collider = result["collider"]
			collider.queue_free()


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play() # Replace with function body.
