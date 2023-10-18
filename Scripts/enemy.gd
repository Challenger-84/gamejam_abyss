extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var health : int = 10

func _ready():
	animated_sprite.play("idle")
	
	var emitter = $HurtBox
	emitter.take_damage.connect(take_damage)

func take_damage():
	health -= 1
	if health <= 0:
		queue_free()
