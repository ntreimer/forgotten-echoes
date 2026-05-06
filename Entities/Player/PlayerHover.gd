extends State


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	player.velocity = Vector2.ZERO
	await get_tree().create_timer(1).timeout
	print("I finished my 3 sec counter!")
	
	if state_machine.current_state == self:
		state_machine.transition_to("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(delta):
	player.move_and_slide()
	print("calling hover physics update")
