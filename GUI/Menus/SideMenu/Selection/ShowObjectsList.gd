extends VBoxContainer

var figures = []
onready var SM = get_node("/root/SelectionMenu")


func _ready():
	figures = SM.get_figures()


func _physics_process(_delta):
	if SM.new_object:
		add_child(figures[figures.size()-1].get_selection_button())
		SM.new_object = false
