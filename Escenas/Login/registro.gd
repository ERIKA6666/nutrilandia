extends Node2D

func _on_pressed() -> void:
 # Obtén los textos de los LineEdit y elimina espacios.
	var name_text = $PlayerNameInput.text.strip_edges()
	var age_text = $PlayerAgeInput2.text.strip_edges()

	# Validación: Nombre no vacío y edad numérica.
	if name_text == "":
		$VBoxContainer/NameInput.placeholder_text = "¡Escribe tu nombre!"
		return

	if age_text == "" || !age_text.is_valid_int():
		$VBoxContainer/AgeInput.placeholder_text = "Edad inválida"
		return

	# Guarda en Global.gd.
	#Global.player_name = name_text
	#Global.player_age = int(age_text)  # Convierte a entero.
	 # Verificar en consola
	#Global.print_player_data()  # ¡Aquí se imprimen los datos!
