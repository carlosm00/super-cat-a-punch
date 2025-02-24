extends Node2D

func _ready():
	$init.connect("pressed", Callable(self, "_init_pressed"))
	
func _init_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
