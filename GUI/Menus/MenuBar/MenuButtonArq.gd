extends 'res://GUI/Menus/MenuBar/MenuButtonMain.gd'

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in ["File","Save","Quit"]:
		get_popup().add_item(i)
	get_popup().set_item_shortcut(0,set_shortcut(KEY_F),true)
	get_popup().set_item_shortcut(1,set_shortcut(KEY_S),true)
	get_popup().set_item_shortcut(2,set_shortcut(KEY_Q),true)
	
	get_popup().connect("id_pressed", self, "_on_item_pressed")
	
func _on_item_pressed(id):
	var item_name = get_popup().get_item_text(id)
	if item_name == "Quit":
		get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
