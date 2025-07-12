extends Node2D

func _ready():
	$level1.connect("pressed", Callable(self, "_goto_level1"))
	$level2.connect("pressed", Callable(self, "_goto_level2"))
	$level3.connect("pressed", Callable(self, "_goto_level3"))
	$level4.connect("pressed", Callable(self, "_goto_level4"))

func _goto_level1():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _goto_level2():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	
func _goto_level3():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	
func _goto_level4():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
