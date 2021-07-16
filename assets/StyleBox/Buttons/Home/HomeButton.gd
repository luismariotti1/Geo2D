extends Button

onready var Res = get_node("/root/MenusResolutions")


var grid

func _ready():
	grid = get_parent().get_node("Display/Grid")

func _on_HomeButton_toggled(button_pressed):
	grid.axis_center_position = Vector2(grid.limitX / 2, grid.limitY / 2)

func _process(_delta):
	set_margin(MARGIN_TOP, Res.get_home_button().position.y-40)
	set_margin(MARGIN_LEFT, Res.get_home_button().position.x-280)
	set_margin(MARGIN_RIGHT, Res.get_home_button().size.x-280)
	set_margin(MARGIN_BOTTOM, Res.get_home_button().size.y-40)
	
