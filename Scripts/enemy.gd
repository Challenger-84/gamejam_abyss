extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.play("idle")

func _on_area_2d_body_entered(body):
	Globals.health -= 1
	print("Player entered")
