extends EnemyBase

const SPEED = 100.0
const ATTACK_DISTANCE = 40.0

func _ready():
	sprite.play("idle")
	speed = SPEED

func get_attack_distance() -> float:
	return ATTACK_DISTANCE

func play_attack():
	print("Drunk attacks")
	await get_tree().create_timer(0.7).timeout
	sprite.play("idle")
