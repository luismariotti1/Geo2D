extends 'res://GUI/Menus/MenuBar/MenuButtonMain.gd'


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_popup().add_item("About")
	get_popup().connect("id_pressed", self, "_on_item_help_pressed")
	get_popup().set_item_shortcut(0,set_shortcut(KEY_A),true)

func _on_item_help_pressed(id):
	var item_name = get_popup().get_item_text(id)
	if item_name == "About":
		$WindowDialogAbout.popup()
	

func _on_LinkButton_pressed():
	OS.shell_open("https://github.com/luismariotti1")


func _on_LinkButton2_pressed():
	OS.shell_open("https://github.com/Srdiegoibs")


func _on_LinkButton3_pressed():
	OS.shell_open("https://github.com/Eb3r-r00t")
