extends Node2D

export (PackedScene) var liht_scene

func _ready() -> void:
	globals.max_score += 1


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		area.queue_free()
		globals.max_score -= 1
		var l= liht_scene.instance()
		l.position = position + $Area2D.position
		get_parent().call_deferred("add_child", l)
		queue_free()
		
