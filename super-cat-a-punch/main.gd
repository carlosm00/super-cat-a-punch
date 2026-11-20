extends Control

func _ready():
	$Init.grab_focus()
	$Init.connect("pressed", Callable(self, "_init_pressed"))
	
func _init_pressed():
	get_tree().change_scene_to_file("res://menus/menu.tscn")
