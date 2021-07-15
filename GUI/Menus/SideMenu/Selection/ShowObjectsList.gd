extends VBoxContainer

var button = load("res://GUI/Menus/SideMenu/Selection/SelectionObject/SelectionObject.tscn")
var buttons = []
onready var SM = get_node("/root/SelectionMenu")

func _physics_process(_delta):
	if SM.new_object:
		var but = button.instance()
		but.init("Square")
		add_child(but)
		SM.new_object = false
