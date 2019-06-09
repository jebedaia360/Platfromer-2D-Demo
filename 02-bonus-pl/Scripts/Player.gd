extends RigidBody2D

export var speed := 200
export var jump_high := 100

var normal_scale : Vector2

func _ready():
	normal_scale = $Sprite.scale
	
func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_right"):
		linear_velocity.x += speed * delta
		$Sprite.scale.x = normal_scale.x
	
	if Input.is_action_pressed("ui_left"):
		linear_velocity.x -= speed * delta
		$Sprite.scale.x = -normal_scale.x
	
	if Input.is_action_just_pressed("ui_select"):
		if $RayCast2D.is_colliding():
			linear_velocity.y -= jump_high