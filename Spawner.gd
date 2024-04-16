extends Node

var enemy_scene = preload("res://Characters/enemy_test_test.tscn")


func _spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	var player = $"../Player"

	$"..".add_child(enemy_instance)
	
	var radius = 300

	enemy_instance.position = spawn_location(player, radius)
	
	player.connect("position_changed", enemy_instance._on_player_position_changed)

func spawn_enemy():
	_spawn_enemy()
	

func spawn_location(player, radius):
	var angle = randf_range(0, 2 * PI)
	var x = player.position.x + (radius * cos(angle))
	var y = player.position.y + (radius * sin(angle))
	var point = Vector2(x, y)
	return point
	
