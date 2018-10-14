extends Node2D

var prev_window_size = Vector2()

func _ready():
	prev_window_size = globals.default_window_size

func _process(delta):
	if OS.window_size != prev_window_size:
		var width = globals.default_window_size.x
		scale.x = OS.window_size.x / width
		scale.y = scale.x
		prev_window_size = OS.window_size
