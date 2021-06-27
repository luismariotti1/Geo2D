
extends 'res://GUI/Menus/MenuBar/MenuButtonMain.gd'

# Called when the node enters the scene tree for the first time.
func _ready():
	get_popup().add_item("About")
	get_popup().connect("id_pressed", self, "_on_item_help_pressed")
	get_popup().set_item_shortcut(0,set_shortcut(KEY_A),true)

func _on_item_help_pressed(id):
	var item_name = get_popup().get_item_text(id)
	if item_name == "About":
		var popup = load("res://GUI/PopUp/About/About.tscn").instance()
		get_tree().get_root().get_node("Main/Layout").add_child(popup)
		popup.popup()
