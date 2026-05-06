extends State


func physics_update(_delta):
	if not player.is_on_floor():
		state_machine.transition_to("fall")
		return
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		state_machine.transition_to("run")
	else:
		player.sprite.play("idle")
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jump")
		
