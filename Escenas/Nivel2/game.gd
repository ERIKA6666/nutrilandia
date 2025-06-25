extends Node

@onready var player = $Player
var scoreJugador := 0

func _ready():
	# Conectar señales del jugador
	player.scoreUP.connect(subirScore)
	player.playerDied.connect(morir)
	
	# Ocultar la pantalla de muerte al inicio
	$DeathScreen.hide()
	
	# 1. Conectar botones de pantalla de muerte
	if $DeathScreen.has_node("HBoxContainer/ReinicioButton"):
		$DeathScreen/HBoxContainer/ReinicioButton.pressed.connect(_on_reinicio_button_pressed)
	
	if $DeathScreen.has_node("HBoxContainer/SalirButton2"):
		$DeathScreen/HBoxContainer/SalirButton2.pressed.connect(_on_salir_button_2_pressed)

func subirScore():
	scoreJugador += 1
	$ScoreLabel.text = str(scoreJugador)

func morir():
	$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
	$DeathScreen.show()
	get_tree().paused = true

# 2.  - Manejo de botones
func _on_reinicio_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_salir_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/LewebMenu/main.tscn")
