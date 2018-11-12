extends Panel

var current_page = null

func _ready():
	connect("visibility_changed", self, "_on_visibility_changed")
	globals.connect("window_minimized_changed", self, "_on_window_minimized_changed")

func _on_visibility_changed():
	get_tree().paused = visible

func show_page(node):
	if current_page != null:
		current_page.hide()
	node.show()
	current_page = node

func _on_Quit_pressed():
	show_page($QuitPage)

# when preesed "Return" or "No" button in Quit Page
func _on_Return_pressed():
	hide()

# when preesed "Yes" button in Quit Page
func _on_Yes_pressed():
	get_tree().quit()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		visible = !visible

func _on_Options_pressed():
	show_page($OptionsPage)

func _on_window_minimized_changed(value):
	show()
