extends AudioStreamPlayer

export(String, FILE, "*.ogg") var intro_music
export(String, FILE, "*.ogg") var music_loop

func _ready():
	stream = load(intro_music)
	connect("finished", self, "_after_intro")
	play()


func _after_intro():
	print("plays loop")
	stream = load(music_loop)
	disconnect("finished", self, "_after_intro")
	play()
