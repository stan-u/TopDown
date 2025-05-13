extends CharacterBody2D


const SPEED = 300.0
var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("Left", "Right")
	direction.y = Input.get_axis("Up", "Down")
	
	velocity = direction*SPEED
	
	move_and_slide()
