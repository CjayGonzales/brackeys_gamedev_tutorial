extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump_movement") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Dash
	if Input.is_action_just_pressed("dash_movement_right"):
		velocity.x = JUMP_VELOCITY * -3.5
		#animated_sprite_2d.play("roll")
	
	# Handle Dash
	if Input.is_action_just_pressed("dash_movement_left"):
		velocity.x = JUMP_VELOCITY * 3.5
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var direction := Input.get_axis("left_movement", "right_movement")
	
	# adding the animated sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	# play animations 
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("roll")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_coin_7_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
