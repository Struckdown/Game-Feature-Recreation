extends Node2D

export(int) var playerNum = 1
export(NodePath) var playerSlotRef = null
var overlappingCharacters = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	playerSlotRef = get_node(playerSlotRef)
	$Token/PlayerNum.text = "P"+str(playerNum)
	#playerSlotRef.connect("finished", self, "checkForCharacters")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in $Token/Area2D.get_overlapping_areas():
		var anyCharactersAtAll = false
		if i.is_in_group("selectableCharacter"):
			anyCharactersAtAll = true
			if playerSlotRef:
				var pic = i.owner.characterPortrait
				var icon = i.owner.gameicon
				var charName = i.owner.charName
				playerSlotRef.selectNewCharacter(charName, pic.resource_path, icon.resource_path)
				break
		if not anyCharactersAtAll:
			playerSlotRef.selectNewCharacter("", null, null)
