extends Button

var _imgs = []
var _id: int


func init(id, imgs):
	_id = id
	_imgs = imgs
	set_image(_imgs[0])


func get_id():
	return _id


func set_image(img):
	get_node("Sprite").texture = load(img)


func _on_FigureButton_toggled(button_pressed):
	if button_pressed:
		set_image(_imgs[1])
	else:
		get_parent().button_clicked = -1
		set_image(_imgs[0])
