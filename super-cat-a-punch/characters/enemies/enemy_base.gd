class_name EnemyBase
extends CharacterBase

var player

# Chase and attack logic
func get_direction():
	if is_instance_valid(player):
		var distance = global_position.distance_to(player.global_position)
		var direction = player.global_position - global_position

		if distance < get_attack_distance() and not attacking:
			velocity.x = 0
			attack()
		else:
			velocity.x = sign(direction.x) * speed
			visuals.scale.x = -1 if direction.x < 0 else 1
	else:
		velocity.x = 0

# Override in subclass to set the attack trigger distance
func get_attack_distance() -> float:
	return 40.0

# Signals for detecting players
func _on_detector_body_entered(body):
	if body.is_in_group("players"):
		player = body

func _on_detector_body_exited(body):
	if body.is_in_group("players"):
		player = null

# Signal for Attack Area
func _on_attack_area_body_entered(body):
	if body in already_hit:
		return
	if body.is_in_group("players"):
		if body.has_method("take_damage"):
			body.take_damage(attack_damage)
			already_hit.append(body)

# Death
func die():
	print("Enemy died")
	queue_free()
