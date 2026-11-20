extends Node
# Todavía en desarollo, esto es una prueba de concepto
const SAVE_PATH = "res://save_game.bin"

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"lsp": Game.lsp,
		"hp": Game.hp
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.lsp = current_line["lsp"]
