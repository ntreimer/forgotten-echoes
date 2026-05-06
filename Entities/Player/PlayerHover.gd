extends State

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func enter():
	player.velocity = Vector2.ZERO
	timer.start(1)

	# Safety net for unconnected signal
	#if not timer.timeout.is_connected(_on_timer_timeout()):
		#timer.timeout.connect(_on_timer_timeout())	
	
		
func _on_timer_timeout():
	print("inside timeout func")
	state_machine.transition_to("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(delta):
	player.move_and_slide()

func exit():
	timer.stop()
