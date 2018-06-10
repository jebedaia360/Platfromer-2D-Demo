extends Sprite

export var anim = true

func _ready():
	if anim:
		$AnimationPlayer.play("fly")