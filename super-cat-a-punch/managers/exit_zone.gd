extends Area2D

class_name ExitZone

signal player_exited

# Guard to prevent the signal firing more than once per room visit
var _activated := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if _activated:
		return

	if body.is_in_group("players"):
		_activated = true
		print("Soy Concha, salgo!")
		player_exited.emit()
