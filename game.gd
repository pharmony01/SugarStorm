extends Node2D

#var enemy_scene = preload("res://Characters/enemy_test_test.tscn")

func _ready():
	#var enemy = enemy_scene.instantiate()
	var spawn_markers = $EnemyLocations.get_children()
	var selected_spawn = spawn_markers[randi() % spawn_markers.size()]
	#enemy.position = selected_spawn.global_position
	#add_child(enemy)
	$Enemy.position = selected_spawn.global_position
	for n in 10000:
		selected_spawn = spawn_markers[randi() % spawn_markers.size()]
		if selected_spawn.global_position != $Enemy.position:
			break
	$Enemy2.position = selected_spawn.global_position
