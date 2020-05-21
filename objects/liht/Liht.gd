extends Area2D

func _ready() -> void:
	globals.max_score += 1
	$Fire/AnimationPlayer.play("Fly")

func _on_Liht_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Hero":
		globals.score += 1
		queue_free()
