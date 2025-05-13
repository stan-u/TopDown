extends Node2D

var enemy_scene = preload("res://enemy.tscn")
var spawn_marker_scene = preload("res://spawn_marker.tscn")  # You'll need to create this
@onready var player = $/root/World/Player
#@onready var spawn_timer = $/root/World/Timer  # Assuming you have a Timer node
#@onready var label: Label = $/root/World/Label

#var base_spawn_time = 2  # Starting spawn time
#var min_spawn_time = 0.1   # Fastest spawn time
#var spawn_acceleration = 0.01  # How much to reduce the timer each spawn

#var score:int:
#	set(value):
#		score = value
#		label.text = "Score: " + str(score)

func _ready():
	# Initialize the timer
#	spawn_timer.wait_time = base_spawn_time
#	spawn_timer.start()
#	score = 0
	pass

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.global_position = player.global_position
	
	while enemy.global_position.distance_squared_to(player.global_position)<10000:
		enemy.global_position.x = randi_range(0,get_viewport_rect().size.x)
		enemy.global_position.y = randi_range(0,get_viewport_rect().size.y)

"""
func _on_timer_timeout() -> void:
	# Create spawn marker (X sprite)
	var spawn_position = get_valid_spawn_position()
	create_spawn_marker(spawn_position)
	
	# Speed up the spawn timer for next enemy
	spawn_timer.wait_time = max(spawn_timer.wait_time - spawn_acceleration, min_spawn_time)
	
func get_valid_spawn_position():
	var position = Vector2()
	
	# Keep trying until we find a valid position
	while true:
		position.x = randi_range(0, get_viewport_rect().size.x)
		position.y = randi_range(0, get_viewport_rect().size.y)
		
		# Check if far enough from player
		if position.distance_squared_to(player.global_position) >= 10000:
			break
	
	return position

func create_spawn_marker(position):
	var marker = spawn_marker_scene.instantiate()
	marker.global_position = position
	add_child(marker)
	
	# Create a timer to replace marker with enemy after 3 seconds
	var marker_timer = Timer.new()
	marker_timer.wait_time = 3.0
	marker_timer.one_shot = true
	marker_timer.connect("timeout", spawn_enemy.bind(position, marker))
	add_child(marker_timer)
	marker_timer.start()

func spawn_enemy(position, marker):
	# Remove the marker
	marker.queue_free()
	
	# Spawn the actual enemy
	var enemy = enemy_scene.instantiate()
	enemy.global_position = position
	add_child(enemy)"""
