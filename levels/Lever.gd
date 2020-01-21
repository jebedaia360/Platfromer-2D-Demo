extends Area2D

export var move_door : Vector2
export var door_path : NodePath
onready var door : Node2D = get_node(door_path)

var can_open = false

func _ready() -> void:
	connect("body_entered", self, "_on_body_enter")
	connect("body_exited", self, "_on_body_exit")


func _on_body_enter(body:PhysicsBody2D):
	if body.name == "Player":
		can_open = true


func _on_body_exit(body:PhysicsBody2D):
	if body.name == "Player":
		can_open = false


func open_door() -> void:
	$switchLeft.scale.x *= -1
	var start_pos = door.position
	var end_pos = door.position + move_door
	$Tween.interpolate_property(door, "position", start_pos, end_pos, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and can_open:
		open_door()

