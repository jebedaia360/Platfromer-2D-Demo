extends Panel

var prev_window_size = Vector2()

func _ready():
	prev_window_size = globals.default_window_size
	$VBox/ApplyButton.connect("pressed", self, "_on_apply")
	connect("visibility_changed", self, "_on_visibility_changed")

func set_window_options(fullscreen, maximized):
	globals.window_fullscreen = fullscreen
	globals.window_maximized = maximized

func _on_apply():
	var window_type_id = $VBox/WindowBox.current_choice_id
	match window_type_id:
		0: # Windowed
			set_window_options(false, false)
		1: # Fullscreen
			set_window_options(true, false)
		2: # Maximized
			set_window_options(false, true)
		
	globals.window_size = $VBox/ResolutionBox.resolution
	
	if globals.window_size != prev_window_size:
		var width = globals.default_window_size.x
		globals.camera_zoom = width / globals.window_size.x * globals.default_camera_zoom
	
	$VBox/ResolutionBox.update_label(globals.window_size)

func _on_visibility_changed():
	pass