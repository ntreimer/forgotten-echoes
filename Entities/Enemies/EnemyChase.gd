extends State

@onready var enemy: BaseEnemy = actor as BaseEnemy
@export var chase_speed = 70.0


func physics_update(_delta):
	if enemy.can_see_player:
		var dir = (enemy.target.global_position - enemy.global_position).normalized()
		enemy.velocity = dir * enemy.chase_speed
		enemy.move_and_slide()
	else:
		state_machine.transition_to("patrol")
