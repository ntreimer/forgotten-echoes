extends Node
# This script is accessible anywhere in the game
# UI scripts can listen with 

signal life_collected(amount: int)
signal player_died
signal level_completed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
