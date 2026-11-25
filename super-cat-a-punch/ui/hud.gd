extends CanvasLayer

const HEART_SCENE = preload("res://items/heart.tscn")

@onready var hearts_container: HBoxContainer = $HBoxContainer

func update_health(current_health: int) -> void:
	# Eliminar corazones anteriores
	for heart in hearts_container.get_children():
		heart.queue_free()

	# Crear uno por cada vida
	for i in range(current_health):
		var heart = HEART_SCENE.instantiate()
		var otro_heart = $HBoxContainer/Heart4 # no funciona como base :/
		hearts_container.add_child(heart)

# Sibling no es porque sería de la propia escena heart???? Revisar
# Tienen que tener todos los hearts las mismas propiedades o simplementer marcar como visible o no
# Probar a generar x puntos de vida y marcar como visible o no los corazones
