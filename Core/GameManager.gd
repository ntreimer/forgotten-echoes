extends Node

var current_life: int = 3
var is_game_paused: bool = false

func add_life(amount: int):
	current_life += amount
	SignalBus.life_collected.emit(amount)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
