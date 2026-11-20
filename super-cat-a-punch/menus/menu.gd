extends Control

func _ready():
	$Start.grab_focus()
	Utils.save_game()
	Utils.load_game()
	$Start.connect("pressed", Callable(self, "_start_pressed"))
	$Quit.connect("pressed", Callable(self, "_quit_pressed"))
	$QuitConfirmationDialog.connect("confirmed", Callable(self, "_confirm_quit"))

func _start_pressed():
	get_tree().change_scene_to_file("res://menus/level_menu.tscn")


func _quit_pressed():
	$QuitConfirmationDialog.popup_centered()

func _confirm_quit():
	get_tree().quit()
