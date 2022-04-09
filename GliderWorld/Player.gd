extends RigidBody

var directionHeld = Vector2(0,0)
var cameraSpeed = 0.005
var planeSpeed = 0.0
var maxSpeed = 0.5
var planeAcceleration = 0.1

# Camera
var cameraRot_x = 0	# accumulators
var cameraRot_y = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$AnimationPlayer.play("rotatePropeller")

func _input(event):
	if event is InputEventMouseMotion:
		cameraRot_x += event.relative.x * cameraSpeed
		cameraRot_y += event.relative.y * cameraSpeed
		cameraRot_y = clamp(cameraRot_y, -0.7, 0.7)
		$CameraPivot.transform.basis = Basis()	# reset rotation
		$CameraPivot.rotate_object_local(Vector3(0,1,0), cameraRot_x)
		$CameraPivot.rotate_object_local(Vector3(1,0,0), cameraRot_y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	getInputs()
	applyInputs(delta)
	

func getInputs():
	directionHeld = Vector2(0,0)
	if Input.is_action_pressed("left"):
		directionHeld[0] = -1
	if Input.is_action_pressed("right"):
		directionHeld[0] += 1
	if Input.is_action_pressed("down"):
		directionHeld[1] -= 1
	if Input.is_action_pressed("up"):
		directionHeld[1] = 1


func applyInputs(delta):
	#bullet.transform = transform
	#bullet.speed = transform.basis.z * BULLET_SPEED
	
	planeSpeed += planeAcceleration * -directionHeld[1] * delta
	planeSpeed = clamp(planeSpeed, -maxSpeed, maxSpeed)
	add_central_force(transform.basis.x * planeSpeed * 100)

#	translate_object_local(transform.basis.x * planeSpeed)
	
#	rotate_object_local()
	#var movementVector = Vector3(1, 0, 0) * planeSpeed
	#move_and_slide(movementVector)
	$AnimationPlayer.playback_speed = lerp(0, 1, planeSpeed/maxSpeed)

