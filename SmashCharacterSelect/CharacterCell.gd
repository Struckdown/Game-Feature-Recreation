extends MarginContainer
tool

export(String) var charName #setget updateCharName
export(Texture) var characterPortrait #setget updatePortrait
export(Texture) var gameicon

# Called when the node enters the scene tree for the first time.
func _ready():
	updateCharName(charName)
	updatePortrait(characterPortrait)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateCharName(newName):
	charName = newName
	$MarginContainer/VBoxContainer/MarginContainer/Name.text = newName
	if len(newName) > 1:
		var sizeModifier = (len(newName)-5)/10.0
		$MarginContainer/VBoxContainer/MarginContainer/Name.get_font("font").size = lerp(16, 8, sizeModifier)

func updatePortrait(newPortrait):
	characterPortrait = newPortrait
	$MarginContainer/VBoxContainer/Control/BG/MarginContainer/Portrait.texture = newPortrait
