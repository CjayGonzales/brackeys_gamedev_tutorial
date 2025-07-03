extends Area2D


#reference timer $Timer is apath
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("You Died")
	timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
