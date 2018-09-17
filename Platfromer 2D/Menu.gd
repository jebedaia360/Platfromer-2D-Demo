extends Panel


func _on_Menu_visibility_changed():
	if visible:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Return_pressed():
	hide()

# when preesed "Yes" button in Quit Page
func _on_Yes_pressed():
	get_tree().quit()

func _on_Quit_pressed():
	$QuitPage.show()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		visible = !visible 