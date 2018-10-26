extends Node2D

func _ready():
	globals.connect("window_resized", self, "_on_window_resized")

func _on_window_resized():
	var w = globals.window_size.x
	if OS.window_fullscreen:
		w = OS.get_screen_size().x
	scale.x = w / globals.prev_window_size.x
	scale.y = scale.x
