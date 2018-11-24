extends Node2D

func _ready():
	connect("body_entered", self, "_on_body_enter")
	$AudioStreamPlayer.connect("finished", self, "_on_sfx_finished")
	globals.to_collect += 1

func _on_body_enter(body):
	if body != globals.player:
		return
	
	globals.collected += 1
	hide()
	disconnect("body_entered", self, "_on_body_enter")
	$AudioStreamPlayer.play()

func _on_sfx_finished():
	queue_free()
