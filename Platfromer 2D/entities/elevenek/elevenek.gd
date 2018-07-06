extends Node2D

export var speed = 10
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


