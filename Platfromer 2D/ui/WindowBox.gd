extends "CollapsedList.gd"

func _ready():
	options_list = [
		"Windowed", # 0
		"Fullscreen", # 1
		"Maximized", # 2
		"Maximized Borderless" # 3
	]

	globals.connect("window_resized", self, "_on_window_type_changed")
	_on_window_type_changed()

func _on_window_type_changed():
	if OS.window_fullscreen:
		current_choice_id = 1
	elif OS.window_maximized:
		if OS.window_borderless:
			current_choice_id = 3
		current_choice_id = 2
	else:
		current_choice_id = 0
		
	update_label()

