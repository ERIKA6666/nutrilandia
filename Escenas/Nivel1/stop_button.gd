extends TextureButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Conecta la señal "pressed" del botón al método "_on_button_pressed"
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	get_tree().paused = not get_tree().paused  # Alterna entre pausa y reanudar
	if get_tree().paused:
		print("Juego pausado")
	else:
		print("Juego reanudado")
