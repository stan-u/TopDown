extends CharacterBody2D

# Enemy properties
@export var speed = 100.0  # Movement speed
@export var detection_radius = 300.0  # How far the enemy can see

# Target reference (the player)
var player = null
var can_see_player = false

func _ready():
	# Find the player node when the enemy spawns
	# Assuming the player has a group called "player"
	if get_tree().has_group("player"):
		player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	# Calculate velocity
	var velocity = Vector2.ZERO
	
	# Check if we have a player reference and can see them
	if player != null:
		# Calculate distance to player
		var distance_to_player = global_position.distance_to(player.global_position)
		
		# Check if player is within detection radius
		if distance_to_player <= detection_radius:
			can_see_player = true
			
			# Calculate direction to player
			var direction = (player.global_position - global_position).normalized()
			
			# Set velocity towards player
			velocity = direction * speed
		else:
			can_see_player = false
	
	# Set the velocity and move
	set_velocity(velocity)
	move_and_slide()
	
	# Optionally rotate sprite to face the player
	if velocity != Vector2.ZERO:
		# Assuming the enemy sprite is pointing right at rotation 0
		rotation = velocity.angle()

# Optional function to draw detection radius in the editor
func _draw():
	if Engine.is_editor_hint():
		draw_circle(Vector2.ZERO, detection_radius, Color(1, 0, 0, 0.2))
