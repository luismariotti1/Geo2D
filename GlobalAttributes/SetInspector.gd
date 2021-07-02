extends Node

var _properties : Array

func init_properties(value):
	_properties = value
	
func set_properties(id, value):
	for i in range(_properties.size()):
		if _properties[i]["id"] == id:
			_properties[i]["value"] = value 

func get_properties_by_id(id):
	for i in range(_properties.size()):
		if _properties[i]["id"] == id:
			return _properties[i]["value"]

func get_properties():
	return _properties
