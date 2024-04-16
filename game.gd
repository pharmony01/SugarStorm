extends Node2D

#var enemy_scene = preload("res://Characters/enemy_test_test.tscn")
var i = 0

func _process(_delta):
	i = i + 1
	if i % 100 == 0:
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
	pass
	
func _physics_process(delta):
	var space_state = get_world_2d().direct_space_state
	
	var query = PhysicsRayQueryParameters2D.create(position, get_global_mouse_position())
	
	var collision = get_world_2d().direct_space_state.intersect_ray(query)
	
	var result = space_state.intersect_ray(query)
	
	# print(result)
	
	for item in result:
		var value = result[item]
		print("Key:", item, "\nValue:", value)
