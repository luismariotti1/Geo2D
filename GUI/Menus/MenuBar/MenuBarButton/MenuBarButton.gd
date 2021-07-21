extends MenuButton

onready var PN = get_node("/root/PanelInfo")
var _title
var _id: int


func init(id, title, tamanho, sub_title, scuts):
	_id = id
	_title = title
	text = title

	for i in range(tamanho):
		get_popup().add_item(String(sub_title[i]))

	for j in range(scuts.size()):
		get_popup().set_item_shortcut(j, set_shortcut(scuts[j]), true)

	get_popup().connect("id_pressed", self, "_on_MenuBarButton_pressed")


func set_shortcut(key):
	var shortcut = ShortCut.new()
	var inputeventkey = InputEventKey.new()
	inputeventkey.set_scancode(key)
	inputeventkey.control = true
	shortcut.set_shortcut(inputeventkey)
	return shortcut


func _on_MenuBarButton_pressed(id):
	var item_name = get_popup().get_item_text(id)
	if item_name == "About":
		var popup = load("res://GUI/PopUp/About/About.tscn").instance()
		get_tree().get_root().get_node("Main/Layout").add_child(popup)
		popup.popup()
	elif item_name == "Quit":
		get_tree().quit()
	elif item_name == "Triangle":
		PN.set_button_selected(item_name)
	elif item_name == "Square":
		PN.set_button_selected(item_name)
	elif item_name == "Hexagon":
		PN.set_button_selected(item_name)
