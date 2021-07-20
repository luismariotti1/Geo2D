extends "res://Figures/Figures.gd"

var _type = "Regular" setget , get_type
var edge = 0 setget set_edge


func get_type():
	return _type

func set_edge(value):
	edge = value

func update_local_values():
	edge = float(Insp.get_properties_by_id("edge"))

func _physics_process(_delta):
	if is_select:
		update_local_values()
