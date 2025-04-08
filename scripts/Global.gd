extends Node

var player_name: String = ""
var player_age: int = 0  # Usamos 0 como valor por defecto.
# Función para debuguear
func print_player_data():
	print("Datos del jugador:")
	print("Nombre: ", player_name)
	print("Edad: ", player_age)
