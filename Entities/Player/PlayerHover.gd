extends State

@onready var timer = $Timer
var dictionary = {}

# Called when the node enters the scene tree for the first time.
func enter(_params: Dictionary = {}):
	player.velocity = Vector2.ZERO
	timer.start(1)

	# Safety net for unconnected signal
	#if not timer.timeout.is_connected(_on_timer_timeout()):
		#timer.timeout.connect(_on_timer_timeout())	
	
		
func _on_timer_timeout():
	print("inside timeout func")
	state_machine.transition_to("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(_delta):
	player.move_and_slide()
	#var direction = Input.get_axis("move_left", "move_right")
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if not input_direction == Vector2(0, 0):
		print("hover inputdir is: ", input_direction)
		dictionary["input_direction"] = input_direction
		print("hover dictionary is: ", dictionary)
		if dictionary:
			state_machine.transition_to("chain", dictionary)

func exit():
	timer.stop()
