extends Node

var enemy_scene = preload("res://Characters/enemy_test_test.tscn")
var enemy_scene_2 = preload("res://Characters/enemy_2.tscn")
var enemy_scene_3 = preload("res://Characters/enemy_3.tscn")
var enemy_scene_4 = preload("res://Characters/enemy_4.tscn")
var enemy_scene_5 = preload("res://Characters/enemy_5.tscn")
var enemy_scene_6 = preload("res://Characters/enemy_6.tscn")

# How far enemies spawn from the player
var radius = 480


func _spawn_enemy():
	var enemy_instance
	var random_int = randi_range(0,5)
	if random_int == 0:
		enemy_instance = enemy_scene.instantiate()
	elif random_int == 1:
		enemy_instance = enemy_scene_2.instantiate()
	elif random_int == 2:
		enemy_instance = enemy_scene_3.instantiate()
	elif random_int == 3:
		enemy_instance = enemy_scene_4.instantiate()
	elif random_int == 4:
		enemy_instance = enemy_scene_5.instantiate()
	else:
		enemy_instance = enemy_scene_6.instantiate()
	var tween = get_tree().create_tween()
	# Custom color
	# var modulate_color : Color
	var color_r = randf_range(0, 1) # RGB is the color
	var color_g = randf_range(0, 0.8)
	var color_b = randf_range(0, 0.8)
	var modulate_color = Color(color_r, color_g, color_b)
	# var modulate_color_a = 1 # A is alpha aka transparency
	# tween.tween_property(enemy_instance, "modulate", Color.RED, 1)
	tween.tween_property(enemy_instance, 'modulate', modulate_color, 0)
	
	var player = $"../Player"

	$"..".add_child(enemy_instance)

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
	
