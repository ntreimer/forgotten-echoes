class_name Player extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var SPEED = 150.0
@export var JUMP_VELOCITY = -400.0


#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	##var direction := Input.get_axis("move_left", "move_right")
	##if direction:
		##velocity.x = direction * SPEED
		##$AnimatedSprite2D.play("run")
		### Flip sprite
		##$AnimatedSprite2D.flip_h = direction < 0
	##else:
		### move_toward adds friction; stop gradually
		##velocity.x = move_toward(velocity.x, 0, SPEED)
		##$AnimatedSprite2D.play("idle")
#
	## Handles character movement and collisions
	#move_and_slide()
