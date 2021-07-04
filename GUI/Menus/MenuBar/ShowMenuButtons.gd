extends HBoxContainer

var titles = [{"name":"File", "sub_menus":["Open", "Save", "Quit"], "scut": [KEY_O,KEY_S,KEY_Q]},
			{"name":"Figure", "sub_menus":["Triangle", "Square", "Hexagon","Vertex"], "scut": [KEY_1,KEY_2,KEY_3, KEY_4]},
			{"name":"Basic Tools", "sub_menus":["Rotation", "Scale","Translation","Shear"], "scut": [KEY_R,KEY_E,KEY_T,KEY_C]},
			{"name":"Help", "sub_menus":["About"], "scut": [KEY_H]}]


onready var Res = get_node("/root/MenusResolutions")

var button = load("res://GUI/Menus/MenuBar/MenuBarButton/MenuBarButton.tscn")
var buttons = []


func _ready():
	for i in range(titles.size()):
		buttons.append(button.instance())
		buttons[buttons.size() - 1].init(i, titles[i]["name"],titles[i]["sub_menus"].size(),titles[i]["sub_menus"], titles[i]["scut"])
		add_child(buttons[buttons.size() - 1])
		

func _process(delta):
	set_margin(MARGIN_RIGHT, Res.get_menu_bar_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_menu_bar_res().size.y)
	

