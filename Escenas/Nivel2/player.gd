extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

# Variables configurables
var speed = 300
var jump_force = -400
var gravity = 30

# Señales
signal scoreUP
signal playerDied

func _physics_process(delta):
	# Movimiento horizontal
	var inputVel = Input.get_axis("ui_left", "ui_right")
	velocity.x = inputVel * speed
	
	# Salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
	
	# Gravedad
	velocity.y += gravity
	
	# Movimiento
	move_and_slide()
	
	# Animaciones
	if is_on_floor():
		if velocity.x != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		animated_sprite.play("idle")
	
	# Dirección del sprite
	if inputVel != 0:
		animated_sprite.flip_h = inputVel < 0

func subirScore():
	animated_sprite.play("hurt")
	$SubirSonido.play()
	emit_signal("scoreUP")

func morirse():
	$morirSonido.play()
	emit_signal("playerDied")
