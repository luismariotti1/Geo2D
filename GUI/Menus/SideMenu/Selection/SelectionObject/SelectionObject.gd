extends Button

var _text: String
var _figure
var _remove = false
onready var Insp = get_node("/root/SetInspector")

func init(FigureName, figure):
	text = FigureName
	_figure = figure


func _on_SelectionObject_toggled(button_pressed):
	if button_pressed:
		set("custom_styles/pressed", load("res://assets/Themes/Buttons/SelectionButtonColor.tres"))


func _on_Button_toggled(button_pressed):
	if button_pressed:
		_figure.select_figure()
	else:
		if _figure.get_is_selected():
			_figure.set_is_selected(false)
			Insp.clear()
			Insp.reload_atributes = true
