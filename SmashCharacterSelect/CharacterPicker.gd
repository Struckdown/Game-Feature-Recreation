extends Node2D

var playerNum = 1
export(NodePath) var playerSlotRef = null

# Called when the node enters the scene tree for the first time.
func _ready():
	playerSlotRef = get_node(playerSlotRef)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("selectableCharacter"):
		if playerSlotRef:
			var pic = area.owner.characterPortrait
			playerSlotRef.selectNewCharacter(pic.resource_path)
