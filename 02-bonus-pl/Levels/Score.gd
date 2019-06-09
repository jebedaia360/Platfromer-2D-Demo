extends Label

export var score_label = "Score:"
export var score_divider = "/"

func _ready() -> void:
	upate_score()

func upate_score():
	text = score_label + str(globals.score ) + score_divider + str(globals.max_score)

func _on_Liht_body_entered(body: PhysicsBody2D) -> void:
	upate_score()
