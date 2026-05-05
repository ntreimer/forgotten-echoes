class_name BaseEnemy extends CharacterBody2D

@export var max_health: int = 100
var current_health: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health

func take_damage(amount: int):
	current_health -= amount
	if current_health <= 0:
		die()

func die():
	queue_free() # Default death

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
