extends Node

const ROOMS: Array[String] = [
	"res://levels/brain_level.tscn",
	"res://levels/another_level.tscn",
	"res://levels/other_level.tscn",
	"res://levels/last_level.tscn",
]

var _visited: Array[String] = []
# Guard to prevent queuing multiple scene changes if go_to_next_room is called twice
var _changing_room := false


# Called by room.gd on _ready to register the current room as visited
# Also resets _changing_room now that the new scene has loaded successfully
func register_room(room_path: String) -> void:
	if room_path not in _visited:
		_visited.append(room_path)

	_changing_room = false
	print("Room visited: ", room_path)


func go_to_next_room() -> void:
	if _changing_room:
		return

	var remaining: Array[String] = []

	for room in ROOMS:
		if room not in _visited:
			remaining.append(room)

	# All rooms visited — reset history and return to main menu... por ahora
	if remaining.is_empty():
		print("All rooms visited")
		reset()
		get_tree().call_deferred(
			"change_scene_to_file",
			"res://menus/menu.tscn"
		)
		return

	var next: String = remaining.pick_random()

	_changing_room = true
	# Note: if the scene fails to load, _changing_room will stay true and lock
	# the manager permanently... 
	# Debería manejar aquí estos errores de carga de escena o simplemente añado lógica
	# para que pase a la siguiente sala o al menos lo intente???

	print("Next room: ", next)

	# Diferred-calling method to avoid doing it during process or physics frames 
	# (otherwise no collision will work :/ )
	get_tree().call_deferred(
		"change_scene_to_file",
		next
	)


func reset() -> void:
	_visited.clear()
	_changing_room = false
	print("RoomManager reset")
