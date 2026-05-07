extends State

@export var dash_distance: float = 50.0 # unit is pixels
@export var dash_duration: float = 0.1 
var dash_timer: float = 0.0
var dash_direction: Vector2 = Vector2.ZERO
var dash_speed: float = 0.0
var temp_image_scene = preload("res://Entities/Mechanics/Chain/Chain.tscn")

func spawn_chain(spawn_position):
	var instance = temp_image_scene.instantiate()
	instance.position = spawn_position
	add_child(instance)
	await get_tree().create_timer(2.0).timeout
	instance.queue_free()


func enter(params: Dictionary = {}) -> void:
	print("I am in Chain enter")
	var dict_direction = params["input_direction"]
	print("the direction is: ", dict_direction)
	dash_direction = dict_direction.normalized()
	dash_speed = dash_distance / dash_duration
	dash_timer = dash_duration
	
	#player.sprite.play("chain")

# Reminder: delta is the amount of time since previous frame, or last physics call
func physics_update(delta: float) -> void:
	#print("I am in Chain physics")
	player.velocity = dash_direction * dash_speed
	player.move_and_slide()
	spawn_chain(player.global_position)
	# Countdown
	dash_timer -= delta
	if dash_timer <= 0:
		state_machine.transition_to("fall")
