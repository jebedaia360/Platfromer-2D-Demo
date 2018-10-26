extends Panel

func _ready():
	$VBox/ApplyButton.connect("pressed", self, "_on_apply")

func set_window_options(fullscreen, borderless, maximized):
	OS.window_fullscreen = fullscreen
	OS.window_borderless = borderless
	OS.window_maximized = maximized

func _on_apply():
	var window_type_id = $VBox/WindowBox.current_choice_id
	match window_type_id:
		0: # Windowed
			set_window_options(false, false, false)
		1: # Fullscreen
			set_window_options(true, true, false)
		2: # Maximized
			set_window_options(false, false, true)
		3: # Maximized Borderless
			set_window_options(false, true, true)
	
	globals.window_size = $VBox/ResolutionBox.resolution
	var w = globals.window_size.x
	if OS.window_fullscreen:
		w = OS.get_screen_size().x
	
	globals.camera_zoom = globals.prev_window_size.x / w * globals.default_camera_zoom

