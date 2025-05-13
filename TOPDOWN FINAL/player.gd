extends CharacterBody2D

const mov_speed = 200
var direction = Vector2.ZERO
var bullet_scene = preload("res://bullet.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var is_reloading = false

func _physics_process(delta:float) -> void:
	direction.x = Input.get_axis("Left", "Right")
	direction.y = Input.get_axis("Up", "Down")
	
	velocity = direction.normalized()*mov_speed
	
	look_at(get_global_mouse_position())
	
	#if Input.is_action_just_pressed("Shoot"):
	#	var bullet = bullet_scene.instantiate()
	#	bullet.global_position = marker_2d.global_position
	#	bullet.direction = (get_global_mouse_position() - marker_2d.global_position).normalized()
	#	$/root/World.add_child(bullet)
	move_and_slide()
	
	#for i in range(get_slide_collision_count()):
	#	var collision = get_slide_collision(i)
	#	
	#	if collision.get_collider().is_in_group("enemies") and not is_reloading:
	#		is_reloading = true
	#		get_tree().reload_current_scene()
			
