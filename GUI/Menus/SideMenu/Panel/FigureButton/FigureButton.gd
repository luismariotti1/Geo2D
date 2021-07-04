extends Button

var _imgs = []
var _id: int
var hovered = 0.7
var not_hovered = 1


func init(id, imgs):
	_imgs = imgs
	set_image(_imgs[0])
	_id = id


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


func _on_FigureButton_mouse_exited():
	modulate.r = not_hovered
	modulate.g = not_hovered
	modulate.b = not_hovered


func _on_FigureButton_mouse_entered():
	modulate.r = hovered
	modulate.g = hovered
	modulate.b = hovered
