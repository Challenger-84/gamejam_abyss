extends Area2D


func _on_body_entered(body):
	Globals.fruits += 1
	queue_free()
