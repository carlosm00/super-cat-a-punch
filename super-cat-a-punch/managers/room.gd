extends Node2D

# Attach to the root node of any *_level scene.
# Requires an Exit (ExitZone/Area2D), an Entry (Marker2D), and a Sergio node as direct children.

@onready var _exit: ExitZone = $Exit
@onready var _entry: Marker2D = $Entry
@onready var _player: CharacterBase = $Sergio

# Guard to prevent _on_player_exited firing more than once per room... Yes, it can happen
var _transitioning := false


func _ready() -> void:
	# Register this room with the manager and reset the transition lock
	RoomManager.register_room(scene_file_path)

	_place_player()

	# Disable exit monitoring for this frame so the freshly placed player
	# cannot immediately trigger it, then re-enable on the next frame
	_exit.monitoring = false
	_exit.player_exited.connect(_on_player_exited)
	_exit.set_deferred("monitoring", true)


func _place_player() -> void:
	_player.global_position = _entry.global_position
	# Clear any velocity carried over from the previous room... otherwise it keeps running
	_player.velocity = Vector2.ZERO
	print("Soy Concha, entro!")


func _on_player_exited() -> void:
	if _transitioning:
		return

	_transitioning = true
	print("Room exit detected")
	RoomManager.go_to_next_room()
