extends Node

var properties : Array

func init_properties(value):
	properties = value
	
func set_properties(id, value):
	for i in range(properties.size()):
		if properties[i]["id"] == id:
			properties[i]["value"] = value 

func get_properties_by_id(id):
	for i in range(properties.size()):
		if properties[i]["id"] == id:
			return properties[i]["value"]

func get_properties():
	return properties
