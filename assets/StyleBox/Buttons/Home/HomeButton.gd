extends Button

var grid

func _ready():
	grid = get_parent().get_node("Display/Grid")

func _on_HomeButton_toggled(button_pressed):
	grid.axis_center_position = Vector2(grid.limitX / 2, grid.limitY / 2)
