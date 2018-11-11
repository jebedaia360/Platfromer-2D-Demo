extends ViewportContainer


func _ready():
	globals.connect("window_size_changed", self, "_on_window_size_changed")

func _on_window_size_changed(prev, now):
	rect_size = now
	$Viewport.size = now
