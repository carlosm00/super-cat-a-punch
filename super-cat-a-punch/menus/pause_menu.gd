extends CanvasLayer

func _ready():
	$PausePanel/VBoxContainer/Resume.connect("pressed", Callable(self, "_on_resume"))
	$PausePanel/VBoxContainer/MainMenu.connect("pressed", Callable(self, "_on_main_menu"))
	$PausePanel/VBoxContainer/Quit.connect("pressed", Callable(self, "_on_quit"))
	$QuitConfirmationDialog.connect("confirmed", Callable(self, "_confirm_quit"))
	$QuitConfirmationDialog.connect("canceled", Callable(self, "_on_quit_canceled"))
	$QuitConfirmationDialog.get_cancel_button().connect("pressed", Callable(self, "_on_quit_canceled"))
	$MainMenuConfirmationDialog.connect("confirmed", Callable(self, "_confirm_main_menu"))
	$MainMenuConfirmationDialog.connect("canceled", Callable(self, "_on_main_menu_canceled"))
	$MainMenuConfirmationDialog.get_cancel_button().connect("pressed", Callable(self, "_on_main_menu_canceled"))
	hide()

func _input(event):
	# Pause option leads to pause menu
	if event.is_action_pressed("pause"):
		toggle()
		get_viewport().set_input_as_handled()
	# Options logic and visualization of Pause menu
	elif event.is_action_pressed("ui_cancel"):
		if $QuitConfirmationDialog.visible:
			$QuitConfirmationDialog.hide()
			_on_quit_canceled()
			get_viewport().set_input_as_handled()
		# 
		elif $MainMenuConfirmationDialog.visible:
			$MainMenuConfirmationDialog.hide()
			_on_main_menu_canceled()
			get_viewport().set_input_as_handled()
		elif visible:
			resume()
			get_viewport().set_input_as_handled()

func toggle():
	if visible:
		resume()
	else:
		pause()
# Pause-the-game logic
func pause():
	show()
	get_tree().paused = true
	$PausePanel/VBoxContainer/Resume.grab_focus()
# Continuing game
func resume():
	hide()
	get_tree().paused = false

func _on_resume():
	resume()

func _on_main_menu():
	$MainMenuConfirmationDialog.popup_centered()

func _on_main_menu_canceled():
	$PausePanel/VBoxContainer/MainMenu.grab_focus()

func _confirm_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit():
	$QuitConfirmationDialog.popup_centered()

func _on_quit_canceled():
	$PausePanel/VBoxContainer/Quit.grab_focus()

func _confirm_quit():
	get_tree().quit()
