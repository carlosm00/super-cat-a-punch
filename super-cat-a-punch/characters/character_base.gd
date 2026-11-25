class_name CharacterBase
extends CharacterBody2D


# Signals
signal hit

# General variables
@export var speed = 200.0
@export var attack_damage = 1
@export var health = 10
@onready var visuals = $Visuals
@onready var attack_area = $Visuals/AttackArea
@onready var sprite: AnimatedSprite2D = $Visuals/AnimatedSprite2D

# Control variables
const JUMP_VELOCITY = -400.0
var attacking = false
var already_hit = []
var invulnerable = false

func _physics_process(delta: float) -> void:
	# When player is not on the floor, we consider it's falling/jumping
	if not is_on_floor():
		velocity += get_gravity() * delta

	get_direction()
	is_jumping()
	get_state()
	
	move_and_slide()

# Get direction
func get_direction():
	pass

func is_jumping():
	pass

func get_state():
	pass

func attack():
	attacking = true
	already_hit.clear()

	attack_area.monitoring = true
	play_attack()
	await get_tree().create_timer(0.2).timeout
	attack_area.monitoring = false
	await get_tree().create_timer(0.2).timeout
	attacking = false

# Take Damage func
func take_damage(amount):
	# If player was already hit, consider moment of invulnerability
	if invulnerable:
		return

	# Health reduction logic
	health -= amount
	print("Character took damage: ", amount, " | HP:", health)
	update_health_bar()


	# Death consideration
	if health <= 0:
		die()
		return

	# When hit, consider moment of invulnerability. TODO: add timout as input
	invulnerable = true
	await get_tree().create_timer(0.5).timeout
	invulnerable = false

# Death function
func die():
	queue_free()

func play_death():
	pass

func play_attack():
	pass

func update_health_bar() -> void:
	var hud = get_tree().get_first_node_in_group("hud")
	print("Found HUD")

	if hud != null:
		hud.update_health(health)
	else:
		print("No se ha encontrado el HUD")
