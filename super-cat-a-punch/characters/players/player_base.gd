class_name PlayerBase
extends CharacterBase

# Signal for attacks
# TODO: Normalize with enemies
func _on_attack_area_body_entered(body):
	# No constant attack
	if body in already_hit:
		return
	# Enemy takes damage
	if body.is_in_group("enemies"):
		if body.has_method("take_damage"):
			body.take_damage(attack_damage)
			already_hit.append(body)

func get_direction():
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Direction is detected to apply a flip on player sprite
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		visuals.scale.x = -1 if direction < 0 else 1
	# Horizontal movement
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# Attack activation: Character specific. TODO: Remove from here
	if Input.is_action_just_pressed("attack_1") and not attacking:
		attack()

	# Animations : General (?)
	if not attacking:
		if not is_on_floor():
			sprite.play("jump")
		elif direction != 0:
			sprite.play("walk")
		else:
			sprite.play("idle")
