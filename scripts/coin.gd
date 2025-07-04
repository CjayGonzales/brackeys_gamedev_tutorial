extends Area2D

@onready var game_manager: Node = %"GameManager"
@onready var animation_player: AnimationPlayer = $AnimationPlayer



# signal - used like event handlers. Eg. Passing through a coin
# used a collision to set the coin to only interact with the player

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
	#removes coin from scene
