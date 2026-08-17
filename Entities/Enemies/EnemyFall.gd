extends State

var enemy: BaseEnemy:
	get:
		return actor as BaseEnemy

func enter(_params: Dictionary = {}):
	#enemy.sprite.play("fall")
	return

func physics_update(delta):
	enemy.velocity += enemy.get_gravity() * delta
	#var direction = Input.get_axis("move_left", "move_right")
	
	#if direction:
		#enemy.velocity.x = direction * enemy.SPEED
		#enemy.sprite.flip_h = direction < 0
	
	enemy.move_and_slide()
	
	
	if enemy.is_on_floor():
		state_machine.transition_to("patrol")
