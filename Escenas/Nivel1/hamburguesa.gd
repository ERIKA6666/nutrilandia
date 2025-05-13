extends CharacterBody2D

var escala_actual = 2.0
var escala_minima = 0.3
var velocidad = 30

# Añade esta variable para debug
var debug_contador = 0

func _ready():
	add_to_group("comida_chatarra")
	print("Hamburguesa INICIALIZADA")

func _physics_process(_delta):
	velocity = Vector2.LEFT * velocidad
	move_and_slide()

func reducir_tamano():
	debug_contador += 1
	escala_actual *= 0.8
	scale = Vector2(escala_actual, escala_actual)
	
	print("Intento #{debug_contador} | Escala: {scale} | Memoria: {self.get_instance_id()}")
	
	# Forzar actualización inmediata
	queue_redraw()
	
	if escala_actual <= escala_minima:
		print("¡HAMBURGUESA DESTRUIDA!")
		queue_free()
