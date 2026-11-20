extends Control
# Todavía en desarollo, esto es una prueba de concepto

func _ready():
	$Level1.grab_focus()
	$Level1.connect("pressed", Callable(self, "_goto_level1"))
	$Level2.connect("pressed", Callable(self, "_goto_level2"))
	$Level3.connect("pressed", Callable(self, "_goto_level3"))
	$Level4.connect("pressed", Callable(self, "_goto_level4"))
	$Back.connect("pressed", Callable(self, "_go_back"))

func _goto_level1():
	get_tree().change_scene_to_file("res://levels/brain_level.tscn")

func _goto_level2():
	get_tree().change_scene_to_file("res://levels/lvl2/lvl2_1.tscn")
	
func _goto_level3():
	get_tree().change_scene_to_file("res://levels/lvl3/lvl3_1.tscn")
	
func _goto_level4():
	get_tree().change_scene_to_file("res://levels/lvl4/lvl4_1.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		_go_back()

func _go_back():
	get_tree().change_scene_to_file("res://menus/menu.tscn")
