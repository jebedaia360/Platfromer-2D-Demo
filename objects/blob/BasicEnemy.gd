extends RigidBody2D

export var speed := 200
var right := true # czy porusza się w prawo


func _physics_process(delta: float) -> void:
	if right:
		linear_velocity.x = speed
	
	else:
		linear_velocity.x = -speed
