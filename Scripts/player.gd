extends CharacterBody2D


@export var speed = 800.0
@export var acceleration = 4000.0
@export var friction = 2500.0

@export var healthbar : ProgressBar
@export var fruitcounter : Label

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.play("idle")
	
func _physics_process(delta):
	var direction = Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	velocity = velocity.move_toward(direction * speed , acceleration * delta)
	
	if direction == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	if Input.is_action_just_pressed("ui_accept") and Globals.health < Globals.max_health and Globals.fruits > 0:
		Globals.health += 1	
		Globals.fruits -= 1
	healthbar.value = Globals.health * 10
	fruitcounter.text = "Fruits " + str(Globals.fruits)
	if Globals.health <= 0:
		Globals.health = Globals.max_health
		get_tree().reload_current_scene()
	
	move_and_slide()
