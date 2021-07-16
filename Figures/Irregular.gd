extends "res://Figures/Figures.gd"

var _type = "Irregular" setget , get_type
var is_ready = false

func get_type():
	return _type

func create_next_vertex(pos):
    print(pos)
    vertex.append(pos)
    print(vertex)