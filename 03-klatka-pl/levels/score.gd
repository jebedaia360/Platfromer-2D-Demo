extends Label

export var score_label = "Score:"
export var score_divider = "/"

func _ready() -> void:
	ui_update()

func ui_update():
	text = score_label + str(globals.score ) + score_divider + str(globals.max_score)

