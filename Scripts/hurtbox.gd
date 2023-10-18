class_name HurtBox
extends Area2D

signal take_damage

func _ready():
	connect("area_entered", _on_area_entered)
	

func _on_area_entered(hitbox : HitBox) -> void:
	if hitbox == null:
		return
	emit_signal("take_damage")
