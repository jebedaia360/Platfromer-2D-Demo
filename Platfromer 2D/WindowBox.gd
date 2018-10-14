extends VBoxContainer

var window_types = [
	"Windowed",
	"Fullscreen",
	"Maximized",
	"Maximized Borderless"
]

var current_choice_id = 0

func _ready():
	connect("visibility_changed", self, "_on_visibility_changed")
	$HBox/PrevButton.connect("pressed", self, "_on_prev_button")
	$HBox/NextButton.connect("pressed", self, "_on_next_button")

func _on_visibility_changed():
	if not visible:
		return
		
	if OS.window_fullscreen:
		current_choice_id = 1
	elif OS.window_maximized:
		if OS.window_borderless:
			current_choice_id = 3
		current_choice_id = 2
	else:
		current_choice_id = 0
		
	update_label()

func update_label():
	$HBox/Label.text = window_types[current_choice_id]

func _on_prev_button():
	if current_choice_id == 0:
		current_choice_id = window_types.size() - 1
	else:
		current_choice_id -= 1
		
	update_label()

func _on_next_button():
	if current_choice_id == window_types.size() - 1:
		current_choice_id = 0
	else:
		current_choice_id += 1

	update_label()
