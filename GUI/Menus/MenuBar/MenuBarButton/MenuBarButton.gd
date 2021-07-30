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


func create_popup(popup):
	var layout = get_tree().get_root().get_node("Main/Layout")
	layout.add_child(popup)
	layout.center_pop_up(popup)
	popup.popup()


func _on_MenuBarButton_pressed(id):
	var item_name = get_popup().get_item_text(id)
	match item_name:
		"About":
			create_popup(load("res://GUI/PopUp/About/About.tscn").instance())
		"Regular":
			create_popup(load("res://GUI/CreateMenus/CreateRegularFigure.tscn").instance())
