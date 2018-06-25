extends Node2D

export var speed = 10
var player

func _ready():
	player = get_node("../Player")
	connect("body_entered", self, "_on_body_enter")


func _on_body_enter(body):
	if body != player:
		return
	
	queue_free()


