extends 'res://GUI/Menus/MenuBar/MenuButtonMain.gd'


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in ['Point','Triangle','Square','Hexagon']:
		get_popup().add_item(i)

	get_popup().set_item_shortcut(0,set_shortcut(KEY_Z),true)
	get_popup().set_item_shortcut(1,set_shortcut(KEY_X),true)
	get_popup().set_item_shortcut(2,set_shortcut(KEY_C),true)
	get_popup().set_item_shortcut(3,set_shortcut(KEY_V),true)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
