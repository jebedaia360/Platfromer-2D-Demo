extends RigidBody2D

export var max_speed = 300
export var acc = 600
export var jump_high = 400
var curr_speed = 0
onready var ray = $RayCast2D

func _ready():
	$AnimationTreePlayer.active = true

func _process(delta):
	var x = abs(clamp(linear_velocity.x, -1, 1))
	$AnimationTreePlayer.blend2_node_set_amount("idle-run", x)
		
	var y = floor(clamp(linear_velocity.y, -100, 100))/100
	$AnimationTreePlayer.blend3_node_set_amount("air", y)
	
	if y > 0 and ray.is_colliding():
		$AnimationTreePlayer.oneshot_node_start("land")
	
	if curr_speed > 0:
		$BodyParts.scale.x = 1
	if curr_speed < 0:
		$BodyParts.scale.x = -1
		
	if y == 1 and $BodyParts.scale.x == -1:
		$BodyParts.rotation *= -1

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if curr_speed < max_speed:
			curr_speed += delta * acc

		set_axis_velocity(
			Vector2(curr_speed, 0)
		)
	
	elif Input.is_action_pressed("ui_left"):
		if curr_speed > -max_speed:
			curr_speed -= delta * acc

		set_axis_velocity(
			Vector2(curr_speed, 0)
		)
	
	else:
		if curr_speed != 0:
			if curr_speed > 0:
				curr_speed -= delta * acc
			
			elif curr_speed < 0:
				curr_speed += delta * acc

			set_axis_velocity(
				Vector2(curr_speed, 0)
			)
	
	if Input.is_action_pressed("ui_up"):
		if ray.is_colliding():
			set_axis_velocity(
				Vector2(0, -jump_high)
			)

