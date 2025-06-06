extends CharacterBody2D

var escala_actual = 2.0
var escala_minima = 0.1
var velocidad = 30
var debug_contador = 0
var puede_moverse = true  # Variable para controlar el movimiento

func _ready():
	add_to_group("comida_chatarra")
	print("Hamburguesa INICIALIZADA")

func _physics_process(delta):
	if not puede_moverse:
		return  # Si no puede moverse, salimos de la función
	
	velocity = Vector2.LEFT * velocidad
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		# Verificar si colisionó con el Node2D (necesita tener un Area2D/CollisionShape2D)
		if collider is Node2D:  # O el tipo específico de tu nodo estático
			reducir_tamano()

func detener_movimiento():
	puede_moverse = false
	velocity = Vector2.ZERO  # Detener cualquier movimiento residual
	print("¡Movimiento detenido por colisión con Node2D!")

func reducir_tamano():
	if  puede_moverse:  # Opcional: solo reducir si está detenido
		debug_contador += 1
		escala_actual *= 0.8
		scale = Vector2(escala_actual, escala_actual)
		
		print("Intento #{0} | Escala: {1} | Memoria: {2}".format(
			[debug_contador, scale, self.get_instance_id()]))
		
		queue_redraw()
		
		if escala_actual <= escala_minima:
			print("¡HAMBURGUESA DESTRUIDA!")
			queue_free()
