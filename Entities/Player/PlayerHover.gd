extends State

@onready var timer = $Timer
var dictionary = {}

# Called when the node enters the scene tree for the first time.
func enter(_params: Dictionary = {}):
	player.velocity = Vector2.ZERO
	timer.start(1)

func _on_timer_timeout():
	state_machine.transition_to("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(_delta):
	player.move_and_slide()
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if not input_direction == Vector2(0, 0):
		dictionary["input_direction"] = input_direction
		if dictionary:
			state_machine.transition_to("chain", dictionary)

func exit():
	timer.stop()
