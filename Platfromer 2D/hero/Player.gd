extends RigidBody2D

export var cam_speed = 150
export var max_speed = 300
export var acc = 600
export var jump_high = 400
var curr_speed = 0
var running = false


func _ready():
	$AnimationTreePlayer.active = true

func _process(delta):
	var x = clamp(linear_velocity.x, -1, 1)
	
	var camx = $Camera2D.offset.x
	if running:
		$Camera2D.offset.x = lerp(camx, 100*x, delta)
		
	var xrun = abs(x)
	if not running:
		xrun = 0
	
	$AnimationTreePlayer.blend2_node_set_amount("idle-run", xrun)
		
	var y = floor(clamp(linear_velocity.y, -100, 100))/100
	$AnimationTreePlayer.blend3_node_set_amount("air", y)
	
	if y > 0 and is_on_floor():
		$AnimationTreePlayer.oneshot_node_start("land")
	
	if curr_speed != 0:
		$BodyParts.scale.x = round(x)

	if y == 1 and $BodyParts.scale.x == -1:
		$BodyParts.rotation *= -1

func _physics_process(delta):
	if is_on_wall():
		linear_velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		run(delta)
		
	elif Input.is_action_pressed("ui_left"):
		run(delta, -1)
	
	else:
		running = false
		
		if curr_speed != 0:
			run(delta, -1, 0)
			run(delta, 1, 0)

	set_axis_velocity(
		Vector2(curr_speed, 0)
	)
		
	if Input.is_action_pressed("ui_up"):
		try_jump()

func run(delta, modif = 1, mspeed = max_speed):
	if modif * curr_speed < mspeed:
		curr_speed += modif * delta * acc
		
	running = true

func try_jump():
	if is_on_floor():
		set_axis_velocity(
			Vector2(0, -jump_high)
		)

func is_on_floor():
	return $RayCastDown.is_colliding()

func is_on_wall():
	var r_wall = $RayCastRight.is_colliding()
	var l_wall = $RayCastLeft.is_colliding()
	return r_wall or l_wall 
