extends HBoxContainer

var titles = ['File', 'Figures', 'Tools', 'Help']

onready var Res = get_node("/root/MenusResolutions")

var button = load("res://GUI/Menus/MenuBar/MenuBarButton/MenuBarButton.tscn")
var buttons = []

func _ready():
	for i in range(titles.size()):
		buttons.append(button.instance())
		buttons[buttons.size() - 1].init(i, titles[i])
		add_child(buttons[buttons.size() - 1])

func _process(delta):
	set_margin(MARGIN_RIGHT, Res.get_menu_bar_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_menu_bar_res().size.y)
