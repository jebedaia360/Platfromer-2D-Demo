extends RigidBody2D

func _physics_process(delta: float) -> void:
	if  0 in [linear_velocity.x, linear_velocity.y]:
		queue_free()
