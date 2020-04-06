extends Path2D

export var time := 2
var right := true # czy porusza się w prawo

func _ready() -> void:
	_on_tween_all_completed()

func _on_tween_all_completed() -> void:
	var s = 0
	var f = 1
	
	if not right:
		s = 1
		f = 0 
	
	$Tween.interpolate_property($PathFollow2D, "unit_offset", s, f, time)
	$Tween.start()
	right = !right
