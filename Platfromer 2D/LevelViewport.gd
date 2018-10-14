extends ViewportContainer

var prev_window_size = Vector2()

func _ready():
	prev_window_size = globals.default_window_size

func _process(delta):
	if OS.window_size != prev_window_size:
		rect_size = OS.window_size
		$Viewport.size = OS.window_size
		prev_window_size = OS.window_size

