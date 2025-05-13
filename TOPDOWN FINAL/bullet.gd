extends Area2D

var direction: Vector2
var speed = 9
var explosion_scene = preload("res://explosion.tscn")

func _physics_process(delta:float) -> void:
	global_position +=direction*speed


func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
		queue_free()
		get_parent().score +=1
		
		var explosion = explosion_scene.instantiate()
		explosion.global_position = global_position
		explosion.emitting = true
		explosion.lifetime = randf_range(0.5,0.8)
		
		$/root/World.add_child(explosion)
