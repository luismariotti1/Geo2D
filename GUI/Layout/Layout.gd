extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuButtonHelp.get_popup().connect("id_pressed", self, "_on_item_help_pressed")

func _on_item_help_pressed(id):
	var item_name = $MenuButtonHelp.get_popup().get_item_text(id)
	if item_name == "About":
		$WindowDialogAbout.popup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
