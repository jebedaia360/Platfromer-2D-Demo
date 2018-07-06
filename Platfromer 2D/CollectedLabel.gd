extends Label

var collected = 0
var to_collect = 0

func _process(delta):
	to_collect = globals.to_collect
	collected = globals.collected
	text = str(collected) + "/" + str(to_collect)




