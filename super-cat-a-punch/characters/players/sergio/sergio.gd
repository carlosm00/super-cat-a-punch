extends PlayerBase

# func _ready() -> void:
#	await get_tree().process_frame
#	update_health_bar()

func play_attack():
	print("Player attacks")
	sprite.play("attack_1")
