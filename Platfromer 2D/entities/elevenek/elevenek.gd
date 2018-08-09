extends Node2D

var player

func _ready():
	player = get_node("../Player")
	connect("body_entered", self, "_on_body_enter")
	globals.to_collect += 1


func _on_body_enter(body):
	if body != player:
		return
	globals.collected += 1
	queue_free()


