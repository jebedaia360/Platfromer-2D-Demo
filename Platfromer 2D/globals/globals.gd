extends Node

var collected = 0 setget _set_collected, _get_collected
var to_collect = 0

const default_camera_zoom = 0.7
var camera_zoom setget _set_camera_zoom, _get_camera_zoom

const default_window_size = Vector2(1024, 600)
var window_size setget _set_window_size, _get_window_size
var prev_window_size

signal collected_changed
signal camera_zoom_changed
signal window_resized
signal window_minimized
signal window_maximized
signal window_fullscreen

func _ready():
	camera_zoom = default_camera_zoom
	prev_window_size = default_window_size

func _set_collected(value):
	collected = value
	emit_signal("collected_changed")

func _get_collected():
	return collected

func _set_window_size(value):
	prev_window_size = OS.window_size
	OS.window_size = value
	emit_signal("window_resized")

func _get_window_size():
	return OS.window_size

func _set_camera_zoom(value):
	camera_zoom = value
	emit_signal("camera_zoom_changed")

func _get_camera_zoom():
	return camera_zoom

func _process():
	if OS.window_minimized:
		emit_signal("window_minimized")
	
	if OS.window_maximized:
		emit_signal("window_maximized")
	
	if OS.window_fullscreen:
		emit_signal("window_fullscreen")


