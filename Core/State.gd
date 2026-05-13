class_name State extends Node

# Reference to the actor and state machine
var actor: CharacterBody2D
var state_machine: StateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func enter(_params: Dictionary = {}):
	pass

func exit():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
