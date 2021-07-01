extends Node

var properties = {}

func init_properties(value):
	properties = value

func set_properties(name, value):
	properties[name] = value

func get_properties():
	return properties
