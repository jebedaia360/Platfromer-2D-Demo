extends ViewportContainer

func _ready():
	globals.connect("window_resized", self, "_on_window_resized")

func _on_window_resized():
	rect_size = OS.window_size
	$Viewport.size = OS.window_size
	prev_window_size = OS.window_size

