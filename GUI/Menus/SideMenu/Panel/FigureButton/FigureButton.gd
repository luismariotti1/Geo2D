extends Button

var _img_default: String
var _img_pressed: String
var _id: int
var _hovered = Color(0.7, 0.7, 0.7)
var _not_hovered = Color(1, 1, 1)
var _figure = "square"


func init(id, configs):
	_figure = configs["figure"]
	_img_default = configs["img_default"]
	_img_pressed = configs["img_pressed"]
	set_image(_img_default)
	_id = id


func get_id():
	return _id


func set_image(img):
	get_node("Sprite").texture = load(img)


func _on_FigureButton_toggled(button_pressed):
	if button_pressed:
		set_image(_img_pressed)
		print(_figure)
	else:
		get_parent().button_clicked = -1
		set_image(_img_default)


func _on_FigureButton_mouse_entered():
	modulate = _hovered


func _on_FigureButton_mouse_exited():
	modulate = _not_hovered
