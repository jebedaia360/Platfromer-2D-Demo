extends Panel

var current_page = null

func _on_Menu_visibility_changed():
	if visible:
		get_tree().paused = true
	else:
		get_tree().paused = false

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
