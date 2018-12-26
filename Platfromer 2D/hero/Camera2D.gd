extends Camera2D

func _ready():
	settings.connect("camera_zoom_changed", self, "_on_camera_zoom_changed")
	
func _on_camera_zoom_changed(value):
	zoom.x = value
	zoom.y = value