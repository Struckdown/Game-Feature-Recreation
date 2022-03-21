extends MarginContainer

var characterTexture

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateCharacterTexture():
	$slotBG/slotBorder/Portrait.texture = load(characterTexture)

func selectNewCharacter(character):
	characterTexture = character
	$AnimationPlayer.play("SelectCharacter")
	
