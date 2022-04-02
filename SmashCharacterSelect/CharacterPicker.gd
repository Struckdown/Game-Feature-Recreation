extends Node2D

export(int) var playerNum = 1
export(NodePath) var playerSlotRef = null

# Called when the node enters the scene tree for the first time.
func _ready():
	playerSlotRef = get_node(playerSlotRef)
	$Token/PlayerNum.text = "P"+str(playerNum)
	#playerSlotRef.connect("finished", self, "checkForCharacters")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var overlappingCharacters = []
	for i in $Token/Area2D.get_overlapping_areas():
		if i.is_in_group("selectableCharacter"):
			overlappingCharacters.append(i)
	if len(overlappingCharacters) == 0:
		playerSlotRef.selectNewCharacter("", null, null)
		return
	var bestChoice = getClosest(overlappingCharacters)

	if playerSlotRef:
		var pic = bestChoice.owner.characterPortrait
		var icon = bestChoice.owner.gameicon
		var charName = bestChoice.owner.charName
		playerSlotRef.selectNewCharacter(charName, pic.resource_path, icon.resource_path)


func getClosest(elements):
	var closest = null
	var dist = INF
	for ele in elements:
		var measuredDist = global_position.distance_squared_to(ele.global_position)
		if measuredDist < dist:
			dist = measuredDist
			closest = ele
	return closest
	
