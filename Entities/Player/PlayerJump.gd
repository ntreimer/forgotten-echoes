extends State

func enter():
	# Runs once upon state transition
	player.sprite.play("jump")
	player.velocity.y = player.JUMP_VELOCITY

func physics_update(delta):
	player.velocity += player.get_gravity() * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
		player.sprite.flip_h = direction < 0
		
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("hover")
		return
	
	player.move_and_slide()
	
	if player.velocity.y >= 0:
		state_machine.transition_to("fall")
