extends Area2D

export var bonus_value = 200
var p


func _on_JumpBonus_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player" and visible:
		body.bonus_jump_high = bonus_value
		p = body
		hide()
		$Timer.start()
		print("bonus skoku on")
		
		

func _on_Timer_timeout() -> void:
	if p:
		p.bonus_jump_high = 0
		p = null
		print("bonus skoku off")
