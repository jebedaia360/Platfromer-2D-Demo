extends Node

var collected = 0 setget set_collected, get_collected
var to_collect = 0

signal collected_changed

func set_collected(value):
	collected = value
	emit_signal("collected_changed")

func get_collected():
	return collected
	
	

