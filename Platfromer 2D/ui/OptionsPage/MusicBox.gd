extends VBoxContainer

var master_bus
var music_bus
var sfx_bus

func _ready():
	master_bus = AudioServer.get_bus_index("Master")
	music_bus = AudioServer.get_bus_index("Music")
	sfx_bus = AudioServer.get_bus_index("SFX")
	
	$VolumeBox/OnButton.connect(
		"pressed", AudioServer,
		"set_bus_mute", [master_bus, false]
	)

	$VolumeBox/OffButton.connect(
		"pressed", AudioServer,
		"set_bus_mute", [master_bus, true]
	)
	
	$VolumeBar.connect(
		"value_changed", self,
		"set_bus_volume", [master_bus]
	)
	
	$MusicBox/OnButton.connect(
		"pressed", AudioServer,
		"set_bus_mute", [music_bus, false]
	)

	$MusicBox/OffButton.connect(
		"pressed", AudioServer,
		"set_bus_mute", [music_bus, true]
	)

	$MusicBar.connect(
		"value_changed", self,
		"set_bus_volume", [music_bus]
	)
	
	$SFXBox/OnButton.connect(
		"pressed", AudioServer,
		"set_bus_mute", [sfx_bus, false]
	)

	$SFXBox/OffButton.connect(
		"pressed", AudioServer,
		"set_bus_mute", [sfx_bus, true]
	)
	
	$SFXBar.connect(
		"value_changed", self,
		"set_bus_volume", [sfx_bus]
	)

	connect("visibility_changed", self, "_on_visibility_changed")

func _on_visibility_changed():
	if not visible:
		return
	
	$VolumeBar.value = get_bus_volume(master_bus)
	$MusicBar.value = get_bus_volume(music_bus)
	$SFXBar.value = get_bus_volume(sfx_bus)

func set_bus_volume(value, bus_id):
	AudioServer.set_bus_volume_db(bus_id, value)

func get_bus_volume(bus_id):
	return AudioServer.get_bus_volume_db(bus_id)
