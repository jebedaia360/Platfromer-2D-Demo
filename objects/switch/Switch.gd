extends Node2D

export var thing_to_move : NodePath
export var move_to_node : NodePath

onready var _thing_to_move : Node2D = get_node(thing_to_move)
onready var _move_to_node : Node2D = get_node(move_to_node)


func _on_Area2D_body_entered(body):
	if body.is_in_group("bullets"):
		var start_pos = _thing_to_move.position 
		var end_pos = _move_to_node.position
		$Tween.interpolate_property(
			_thing_to_move, "position",
			start_pos, end_pos, 0.5,
			Tween.TRANS_LINEAR,Tween.EASE_IN 
		)
		$Tween.start()
		pass
