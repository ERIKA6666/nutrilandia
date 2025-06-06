extends Popup


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Conectar el botón de cerrar (asumiendo que se llama "CerrarBtn")
	var cerrar_btn = $ButtonNo as Button
	if cerrar_btn:
		cerrar_btn.connect("pressed", self. _on_button_no_pressed)


func _on_button_no_pressed() -> void:
	hide()  # Oculta el Popup
	queue_free()
	pass


func _on_button_yes_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Login/Registro.tscn")
