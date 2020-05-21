extends Area2D

export var speed := 100
var current_speed := 100
onready var org_scale = $body.scale

func prepare(_position: Vector2, dright:bool) -> void:
	self.position = _position
	current_speed = speed
	
	# Jeśli pocisk leci w lewo
	if not dright:
		current_speed = -speed
		$body.scale = -org_scale
	
	self.position.x += current_speed / 2.0


func _physics_process(delta: float) -> void:
	position.x += current_speed * delta
