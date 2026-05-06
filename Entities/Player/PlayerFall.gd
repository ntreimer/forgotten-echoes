extends State

func enter():
	player.sprite.play("fall")

func physics_update(delta):
	player.velocity += player.get_gravity() * delta
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
		player.sprite.flip_h = direction < 0
	
	player.move_and_slide()
	
	if player.is_on_floor():
		state_machine.transition_to("idle")
