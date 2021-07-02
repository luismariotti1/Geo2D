extends Button

var _imgs = []
var _id : int

func init(id, imgs):
	_imgs = imgs
	set_image(_imgs[0])
	_id = id


func get_id():
	return _id


func set_image(img):
	get_node("Sprite").texture = load(img)


func _on_FigureButton_toggled(button_pressed):
	if button_pressed and !get_parent().has_one_clicked:
		set_image(_imgs[1])
	else:
		get_parent().button_clicked = -1
		set_image(_imgs[0])
