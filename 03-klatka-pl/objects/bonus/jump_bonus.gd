extends Area2D

export var bonus_value := 300
var p

func _on_JumpBonus_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		body.bonus_jump_high = bonus_value
		p = body
		print("wyższy skok")
		$Timer.start()

func _on_Timer_timeout() -> void:
	if p:
		p.bonus_jump_high = 0
		print("normalny skok")
