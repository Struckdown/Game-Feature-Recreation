extends MarginContainer

var charName
var characterTexture
var icon
export(String) var playerName
export(int) var playerNumber = 1

signal finished

# Called when the node enters the scene tree for the first time.
func _ready():
	$slotBG/slotBorder/PlayerInfo/PlayerNameContainer/PlayerNameBG/PlayerName.text = playerName
	$slotBG/slotBorder/PlayerInfo/PlayerInfo/PlayerNum.text = "P" + str(playerNumber)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateCharacterData():
	$slotBG/slotBorder/PlayerInfo/CharacterName.text = charName
	if characterTexture:
		$slotBG/slotBorder/Portrait.texture = load(characterTexture)
	else:
		$slotBG/slotBorder/Portrait.texture = null
	if icon:
		$slotBG/slotBorder/GameIconBG/GameIcon.texture = load(icon)
	else:
		$slotBG/slotBorder/GameIconBG/GameIcon.texture = null

func selectNewCharacter(_charName, _character, _icon):
	if _charName == $slotBG/slotBorder/PlayerInfo/CharacterName.text :	# return early if same character
		return
	charName = _charName
	characterTexture = _character
	icon = _icon
	$AnimationPlayer.play("SelectCharacter")
	

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"SelectCharacter":
			emit_signal("finished")

func markReleased(released):
	var alpha = 1
	if not released:
		alpha = 0.7
	$slotBG/slotBorder/Portrait.modulate.a = alpha
