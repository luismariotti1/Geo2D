extends Control

func _ready():
	$MenuButtonHelp.get_popup().connect("id_pressed", self, "_on_item_help_pressed")

func _on_item_help_pressed(id):
	var item_name = $MenuButtonHelp.get_popup().get_item_text(id)
	if item_name == "About":
		$WindowDialogAbout.popup()
