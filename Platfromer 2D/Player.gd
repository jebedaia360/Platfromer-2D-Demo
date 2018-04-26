extends RigidBody2D

var max_speed = 300
var acc = 600 
var jump_high = 400
var curr_speed = 0 
onready var ray = $RayCast2D

func _ready():
	$AnimationTreePlayer.active = true

func _process(delta):
	if curr_speed > 0:
		$BodyParts.scale.x = 1
	if curr_speed < 0:
		$BodyParts.scale.x = -1
	
	if ray.is_colliding():
		$AnimationTreePlayer.blend2_node_set_amount(
			"idle-run",
			abs(curr_speed / max_speed)
		)
		
		if Input.is_action_just_pressed("ui_up"):
			$AnimationTreePlayer.oneshot_node_start("jump")
		
	else:
		$AnimationTreePlayer.oneshot_node_start("fall")


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
		
		else:
			var vy = linear_velocity.y
			linear_velocity = Vector2(curr_speed, vy)
	
	if Input.is_action_pressed("ui_up"):
		if ray.is_colliding():
			set_axis_velocity(
				Vector2(0, -jump_high)
			)

