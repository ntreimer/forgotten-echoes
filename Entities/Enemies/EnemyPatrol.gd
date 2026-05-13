extends State

@export var patrol_speed = 50.0
var enemy: BaseEnemy:
	get:
		return actor as BaseEnemy

func physics_update(_delta):
	
	enemy.velocity.x = patrol_speed
	enemy.move_and_slide()
	
	if enemy.is_on_wall():
		patrol_speed *= -1
		#TODO flip sprite
		#if enemy.get_node_or_null("AnimatedSprite2D"):
			#actor.get_node("AnimatedSprited2D").flip_h = patrol_speed < 0
	
	if enemy.can_see_player:
		state_machine.transition_to("chase")
		return
