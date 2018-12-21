extends Node2D


func _ready():
	globals.connect("window_size_changed", self, "_on_window_size_changed")

func _on_window_size_changed(prev, now):
	var width = globals.default_window_size.x
	var height = globals.default_window_size.y
	scale.x = now.x / width
	scale.y = now.y / height
