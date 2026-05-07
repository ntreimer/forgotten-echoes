class_name Player extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var SPEED = 150.0
@export var JUMP_VELOCITY = -400.0

func _on_death_zone_body_entered(body: Node2D) -> void:
	body.global_position = Vector2(0, 0)
