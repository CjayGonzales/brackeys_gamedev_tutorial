extends Area2D


# signal - used like event handlers. Eg. Passing through a coin
# used a collision to set the coin to only interact with the player

func _on_body_entered(body: Node2D) -> void:
	print("+1 coin")
	
	#removes coin from scene
	queue_free()
