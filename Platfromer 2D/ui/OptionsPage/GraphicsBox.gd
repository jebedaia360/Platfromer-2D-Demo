extends VBoxContainer

func _ready():
	$ApplyButton.connect("pressed", self, "_on_apply")

func set_window_options(fullscreen, maximized):
	globals.window_fullscreen = fullscreen
	globals.window_maximized = maximized

func _on_apply():
	match globals.temp_window_type_id:
		0: # Windowed
			set_window_options(false, false)
		1: # Fullscreen
			set_window_options(true, false)
		2: # Maximized
			set_window_options(false, true)
		
	globals.window_size = globals.temp_window_size
	
	if globals.window_size != globals.default_window_size:
		var width = globals.default_window_size.x
		globals.camera_zoom = width / globals.window_size.x * globals.default_camera_zoom

	OS.vsync_enabled = globals.temp_vsync_enabled