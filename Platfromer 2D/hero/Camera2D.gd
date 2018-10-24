extends Camera2D

func _ready():
	globals.connect("camera_zoom_changed", self, "_on_camera_zoom_changed")

func _on_camera_zoom_changed():
	zoom.x = globals.camera_zoom
	zoom.y = globals.camera_zoom