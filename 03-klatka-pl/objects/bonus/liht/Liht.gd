extends Area2D

func _ready() -> void:
	globals.max_score += 1

func _on_Liht_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		globals.score += 1
		var ui = get_tree().get_nodes_in_group("ui")
		
		for n in ui:
			n.ui_update()
		
		queue_free()
