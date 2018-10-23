extends Node2D

func _ready():
	globals.connect("window_resize", self, "_on_window_resize")
	

func _on_window_resize():
	var width = globals.default_window_size.x
	scale.x = OS.window_size.x / width
	scale.y = scale.x
