extends 'res://GUI/Menus/MenuBar/MenuButtonMain.gd'


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in ['Translation','Scale','Rotation']:
		get_popup().add_item(i)

	get_popup().set_item_shortcut(0,set_shortcut(KEY_1),true)
	get_popup().set_item_shortcut(1,set_shortcut(KEY_2),true)
	get_popup().set_item_shortcut(2,set_shortcut(KEY_3),true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
