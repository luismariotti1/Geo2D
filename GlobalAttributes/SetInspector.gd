extends Node

var _properties: Array


func init_properties(info):
	_properties = info


func get_properties():
	return _properties


func check_type(info, type):
	return info.has("type") and info["type"] == type


func set_properties_by_id(id, value):
	for i in range(_properties.size()):
		if check_type(_properties[i], "list"):
			for j in range(_properties[i]["infos"].size()):
				if _properties[i]["infos"][j]["id"] == id:
					_properties[i]["infos"][j]["value"] = value
		elif _properties[i]["id"] == id:
			_properties[i]["value"] = value


func get_properties_by_id(id):
	for i in range(_properties.size()):
		if check_type(_properties[i], "list"):
			for j in range(_properties[i]["infos"].size()):
				if _properties[i]["infos"][j]["id"] == id:
					return _properties[i]["infos"][j]["value"]
		elif _properties[i]["id"] == id:
			return _properties[i]["value"]

