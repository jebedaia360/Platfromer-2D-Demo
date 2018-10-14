extends Panel

var prev_window_size = Vector2()

func _ready():
	prev_window_size = globals.default_window_size
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
	update_label(OS.window_size)

	OS.window_size = $VBox/ResolutionBox.resolution
	
	if OS.window_size != prev_window_size:
		var width = globals.default_window_size.x
		globals.camera_zoom = width / OS.window_size.x * globals.default_camera_zoom
		prev_window_size = OS.window_size