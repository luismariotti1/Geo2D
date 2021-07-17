extends VBoxContainer

var _id: String
var _value
var _insp_data
var _editable = false
var _slider
var _checkbox_x
var _checkbox_y
var _checkbox_x_bool
var _checkbox_y_bool

func init(data):
	_id = data["id"]
	_insp_data = data["value"]
	_slider = get_node("HBoxContainer/HSlider") 
	_checkbox_x = get_node("HBoxContainer/X/CheckBox1") 
	_checkbox_y = get_node("HBoxContainer/Y/CheckBox2") 
	_slider.set_editable(_editable)
	_checkbox_x_bool = _insp_data["X"]
	_checkbox_y_bool = _insp_data["Y"]


func change_editable(boolean):
	_editable = boolean
	_slider.set_editable(_editable)

func update():
	_insp_data["X"] = _checkbox_x_bool
	_insp_data["Y"] = _checkbox_y_bool
	_checkbox_x.pressed = _checkbox_x_bool
	_checkbox_y.pressed = _checkbox_y_bool
	if _checkbox_x_bool or _checkbox_y_bool:
		change_editable(true)
	else:
		_slider.value = 50
		change_editable(false)

func _on_CheckBox1_toggled(button_pressed):
	if button_pressed:
		_checkbox_x_bool = true
		_checkbox_y_bool = false
	else:
		_checkbox_x_bool = false
	update()
	

func _on_CheckBox2_toggled(button_pressed):
	if button_pressed:
		_checkbox_x_bool = false
		_checkbox_y_bool = true
	else:
		_checkbox_y_bool = false
	update()
