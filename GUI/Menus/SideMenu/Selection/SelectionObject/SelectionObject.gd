extends Button

var _text : String

func init(FigureName):
	text = FigureName

func _on_SelectionObject_toggled(button_pressed):
	if(button_pressed):
		set("custom_styles/pressed",load("res://assets/Themes/Buttons/SelectionButtonColor.tres"))


func _on_Button_toggled(button_pressed):
	pass # Replace with function body.
