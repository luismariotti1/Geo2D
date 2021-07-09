extends Button

var _img_default: String
var _img_pressed: String
var _id: int
var _hovered = Color(0.7, 0.7, 0.7)
var _not_hovered = Color(1, 1, 1)
var _figure = "square"
onready var PN = get_node("/root/PanelInfo")


func init(id, configs):
	_id = id
	_figure = configs["figure"]
	_img_default = configs["img_default"]
	_img_pressed = configs["img_pressed"]
	set_image(_img_default)


func get_id():
	return _id


func set_image(img):
	get_node("Sprite").texture = load(img)


func _on_FigureButton_toggled(button_pressed):
	if button_pressed:
		get_parent().button_clicked = _id
		set_image(_img_pressed)
		PN.set_button_selected(_figure)
	else:
		set_image(_img_default)
		if _id == get_parent().button_clicked:
			get_parent().button_clicked = -1
			PN.set_button_selected("")


func _on_FigureButton_mouse_entered():
	modulate = _hovered


func _on_FigureButton_mouse_exited():
	modulate = _not_hovered
