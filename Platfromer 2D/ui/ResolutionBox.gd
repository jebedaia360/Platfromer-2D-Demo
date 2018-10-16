extends VBoxContainer

## taken from https://freegamedev.net/wiki/Screen_Resolutions
var resolution_types = [
	Vector2(640, 480),
	Vector2(800, 480),
	Vector2(1024, 600),
	Vector2(1024, 768),
	Vector2(1200, 900),
	Vector2(1280, 720),
	Vector2(1280, 1024),
	Vector2(1366, 768),
	Vector2(1440, 900),
	Vector2(1680, 1050),
	Vector2(1600, 1200),
	Vector2(1920, 1080),
	Vector2(2560, 1440),
	Vector2(2560, 1600)
]

var resolution = Vector2()

var current_choice_id = 0

func _ready():
	connect("visibility_changed", self, "_on_visibility_changed")
	$HBox/PrevButton.connect("pressed", self, "_on_prev_button")
	$HBox/NextButton.connect("pressed", self, "_on_next_button")

func _process(delta):
	update_label(OS.window_size)

func update_label(size = resolution_types[current_choice_id]):
	$HBox/Label.text = str(size.x) + "x" + str(size.y)
	if not (size in resolution_types):
		resolution_types.append(size)
	resolution = size

func _on_prev_button():
	if current_choice_id == 0:
		current_choice_id = resolution_types.size() - 1
	else:
		current_choice_id -= 1
	
	update_label()

func _on_next_button():
	if current_choice_id == resolution_types.size() - 1:
		current_choice_id = 0
	else:
		current_choice_id += 1

	update_label()
