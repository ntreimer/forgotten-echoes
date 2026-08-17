class_name StateMachine extends Node

@export var initial_state: State
var current_state = State
var states: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_machine = self
			child.actor = owner
			
	if initial_state:
		current_state = initial_state
		initial_state.enter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
		
func transition_to(target_state_name: String, params: Dictionary = {}):
	var new_state = states.get(target_state_name.to_lower())
	print("transitioning from ", current_state.name, " to ", new_state)
	if not new_state:
		return
		
	if current_state:
		current_state.exit()
		
	new_state.enter(params)
	current_state = new_state
