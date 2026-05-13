class_name BaseEnemy extends CharacterBody2D

@onready var vision_area: Area2D = $VisionArea
@onready var los_ray: RayCast2D = $LOS_Ray

@export var max_health: int = 100
var current_health: int
var target: Player = null
var can_see_player: bool = false

func check_line_of_sight():
	if target:
		los_ray.target_position = to_local(target.global_position)
		los_ray.force_raycast_update()
		
		if los_ray.is_colliding():
			var collider = los_ray.get_collider()
			if collider is Player:
				can_see_player = true
				return
				
	can_see_player = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
	vision_area.body_entered.connect(on_vision_area_body_entered)
	vision_area.body_exited.connect(on_vision_area_body_exited)

func take_damage(amount: int):
	current_health -= amount
	if current_health <= 0:
		die()

func die():
	queue_free() # Default death

func on_vision_area_body_entered(body):
	if body is Player:
		target = body
		
func on_vision_area_body_exited(body):
	if body is Player:
		target = null
		can_see_player = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	check_line_of_sight()
