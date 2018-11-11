extends Node

var collected = 0 setget _set_collected, _get_collected
var to_collect = 0

var camera_zoom = 0.7
const default_camera_zoom = 0.7
const default_window_size = Vector2(1024, 600)

signal collected_changed
signal camera_zoom_changed

func _set_collected(value):
	collected = value
	emit_signal("collected_changed")

func _get_collected():
	return collected

