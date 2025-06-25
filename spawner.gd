extends Node2D

var ColeccionableEscena = preload("res://Escenas/Nivel2/colleccionable.tscn")

func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2, 6)
	$Timer.start()

func _on_timer_timeout() -> void:
	var coleccionable = ColeccionableEscena.instantiate()
	add_child(coleccionable)
	
	# Reiniciar temporizador con nuevo tiempo aleatorio
	$Timer.wait_time = randf_range(2, 6)
	$Timer.start()
