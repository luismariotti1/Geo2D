extends Button

var _text: String
var _figure
var _remove = false 

func init(FigureName, figure):
	text = FigureName
	_figure = figure
	
func _on_SelectionObject_toggled(button_pressed):
	if button_pressed:
		set("custom_styles/pressed", load("res://assets/Themes/Buttons/SelectionButtonColor.tres"))


func _on_Button_toggled(button_pressed):
	if button_pressed:
		_figure.select_figure()
