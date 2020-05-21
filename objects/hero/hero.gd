extends RigidBody2D

export var speed := 200
export var jump_high := 100
export (PackedScene) var bullet_scene

var bonus_jump_high : = 0
var dright := true # jeśli true to gracz jest skierowany w prawo, jeśli false to w lewo
var normal_scale : Vector2

func _ready():
	normal_scale = $Sprite.scale
	
func _physics_process(delta: float) -> void:
	linear_velocity.x = lerp(linear_velocity.x, 0, delta)
	
	if $RayCast2D.is_colliding():
		var kb : = $RayCast2D.get_collider() as KinematicBody2D
		if kb and kb.is_in_group("movep"):
			global_position.x = kb.global_position.x
			
	if Input.is_action_pressed("ui_right"):
		dright = true
		linear_velocity.x += speed * delta
		$Sprite.scale.x = normal_scale.x
	
	if Input.is_action_pressed("ui_left"):
		dright = false
		linear_velocity.x -= speed * delta
		$Sprite.scale.x = -normal_scale.x
	
	if Input.is_action_just_pressed("ui_select"):
		if $RayCast2D.is_colliding():
			linear_velocity.y -= jump_high + bonus_jump_high
	
	if Input.is_action_just_pressed("shoot"):
		var b = bullet_scene.instance()
		get_parent().add_child(b)
		b.prepare(position, dright)
