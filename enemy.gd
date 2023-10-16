extends CharacterBody2D


func _on_area_2d_body_entered(body):
	Globals.health -= 1
	print("Player entered")
