extends CharacterBody2D

const SPEED = 250.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

# Idle animation
func _ready():
	get_node("AnimatedSprite2D").play("idle")

# General Physics
func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	if chase == true:
		print("chase on")
		player = get_node("../players/player1")
		print(player)
		var direction = (player.position - self.position).normalized()
		velocity.x = direction * SPEED
	move_and_slide()
	
# Detecting player on when near
func _on_player_detection_body_entered(body):
	print("player detected")
	if body.name == "player1":
		print(body.name)
		chase = true

# Detecting player off
func _on_player_detection_body_exited(body):
	print("player detection exited")
	if body.name == "player1":
		print(body.name)
		chase = false


func _on_player_death_body_entered(body):
	print("player death")
	if body.name == "player1":
		death()


func _on_player_collison_body_entered(body):
	print("collision")
	if body.name == "player1":
		death()


func death():
	chase = false
	self.queue_free()
