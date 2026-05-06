extends State

func physics_update(_delta):
	if not player.is_on_floor():
		state_machine.transition_to("fall")
		return
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
		player.sprite.play("run")
		player.sprite.flip_h = direction < 0
	else:
		# move_toward adds friction; stop gradually
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		state_machine.transition_to("idle")
		
	player.move_and_slide()
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jump")
		
