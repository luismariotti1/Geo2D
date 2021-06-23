extends MenuButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Function to pick up item pressed
func _on_item_pressed(id):
	var item_name = get_popup().get_item_text(id)
	if item_name == "Quit":
		get_tree().quit()

#Function to insert shortcut on buttons 
func set_shortcut(key):
	var shortcut = ShortCut.new()
	var inputeventkey = InputEventKey.new()
	inputeventkey.set_scancode(key)
	inputeventkey.control = true
	shortcut.set_shortcut(inputeventkey)
	return shortcut
