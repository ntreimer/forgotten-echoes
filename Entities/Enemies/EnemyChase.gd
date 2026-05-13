extends State

func physics_update(_delta):
	enemy.move_and_slide()
	
	if enemy.can_see_player:
		state_machine.transition_to("chase")
		return
