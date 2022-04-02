extends Node2D


var grabbableObjects = []
var grabbed = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if not event.pressed:	# handle release
			if grabbed:
				grabbed.playerSlotRef.markReleased(true)
		if len(grabbableObjects) <= 0:
			return
		if grabbed:
			grabbed = null
			return
		var closest = grabbableObjects[0]
		var dist = global_position.distance_squared_to(closest.global_position)
		for obj in grabbableObjects:
			var sqrDist = global_position.distance_squared_to(obj.global_position)
			if sqrDist < dist:
				closest = obj
				dist = sqrDist
		grabbed = closest
		grabbed.playerSlotRef.markReleased(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = get_viewport().get_mouse_position()
	if grabbed:
		grabbed.global_position = global_position


func updateRotation():
	if len(grabbableObjects):
		rotation_degrees = -15
	else:
		rotation_degrees = 0


func _on_PlayerHand_area_entered(area):
	if area.is_in_group("grabbable"):
		grabbableObjects.append(area.owner)
	updateRotation()


func _on_PlayerHand_area_exited(area):
	if area.is_in_group("grabbable"):
		grabbableObjects.erase(area.owner)
	updateRotation()
