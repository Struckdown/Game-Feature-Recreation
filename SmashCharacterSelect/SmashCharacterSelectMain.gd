extends Control

var stock = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		$VBoxContainer/HBoxContainer/PlayerSlot.selectNewCharacter("res://SmashCharacterSelect/Assets/Characters/char_daisy.png")

func _on_Decrement_pressed():
	stock -= 1
	if stock <= 0:
		stock = 99
	$TopBar/SubOption/Lbl.text = str(stock)


func _on_Increment_pressed():
	stock += 1
	if stock >= 100:
		stock = 1
	$TopBar/SubOption/Lbl.text = str(stock)
