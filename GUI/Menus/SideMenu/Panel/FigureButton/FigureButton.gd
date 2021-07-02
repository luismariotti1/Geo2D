extends Button

var _imgs = []
#var can_be_pressed = true
#var pressed = false

func init(imgs):
	_imgs = imgs
	set_image(_imgs[0])
	
func set_image(img):
	get_node("Sprite").texture = load(img)

func _on_FigureButton_toggled(button_pressed):
	if button_pressed and !get_parent().has_one_clicked:
		set_image(_imgs[1])
	else:
		set_image(_imgs[0])
