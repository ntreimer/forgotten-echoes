extends State

func enter():
	# Runs once upon state transition
	player.sprite.play("jump")
	player.velocity.y = player.JUMP_VELOCITY

func physics_update(delta):
	player.velocity += player.get_gravity() * delta
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = direction * player.SPEED
	
	player.move_and_slide()
	
	if player.velocity.y >= 0:
		state_machine.transition_to("fall")
