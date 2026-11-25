extends CanvasLayer

const HEART_SCENE = preload("res://items/heart.tscn") 

var hearts_list : Array[TextureRect]
@onready var hearts_container = $Control/HeartsBox

func _ready() -> void:
	for child in hearts_container.get_children():
		hearts_list.append(child)
	print(hearts_list)

func update_health(current_health: int) -> void:
	for i in hearts_list.size():
		print(hearts_list[-i])
		hearts_list[-i].visible = false
	# Visible objects according to life
	for i in range(current_health):
		print(hearts_list[i].is_visible(),hearts_list[i])
		hearts_list[i].visible = true
	print(hearts_list)
