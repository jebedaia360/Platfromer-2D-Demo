extends Control

export (NodePath) var button_path
onready var button = get_node(button_path)

func ready():
	#Create Connection
	button.connect("toggled", self, "on toggled")
		