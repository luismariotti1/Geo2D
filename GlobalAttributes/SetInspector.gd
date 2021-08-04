extends Node

var _properties: Array
var reload_atributes = false
var atributes


func init_properties(info):
	_properties = info


func set_properties(info):
	_properties = info


func get_properties():
	return _properties


func check_type(info, type):
	return info.has("type") and info["type"] == type


func get_properties_by_id(id):
	for i in range(_properties.size()):
		if check_type(_properties[i], "list"):
			for j in range(_properties[i]["infos"].size()):
				if _properties[i]["infos"][j]["id"] == id:
					return _properties[i]["infos"][j]["value"]
		elif _properties[i]["id"] == id:
			return _properties[i]["value"]


func set_properties_by_id(id, new_value):
	for i in range(_properties.size()):
		if check_type(_properties[i], "list"):
			for j in range(_properties[i]["infos"].size()):
				if _properties[i]["infos"][j]["id"] == id:
					_properties[i]["infos"][j]["value"] = new_value
	for atr in atributes:
		if atr["type"] == "list":
			for list in atr["scene"].get_list():
				if id == list.get_id():
					list.update_inspector(new_value)
		

func clear():
	_properties = []
