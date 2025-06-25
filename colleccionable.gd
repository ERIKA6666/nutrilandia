extends Area2D

var esManzana = false
var spriteDeEnemigo = preload("res://ui/chatarra/a_bad_villian_donut__40b0100a.png")

func _ready():
	if randf() > 0.5:
		esManzana = true
	
	if not esManzana:
		$Sprite.texture = spriteDeEnemigo

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if esManzana:
			body.subirScore()
		else:
			body.morirse()
		queue_free()

func _process(delta: float) -> void:
	position.y += 1
