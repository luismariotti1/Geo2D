extends MenuButton


var _title
var _id: int

func init(id, title,tamanho, sub_title):
	_id = id
	_title = title
	text = title
	
	for i in range(tamanho):
#		print(shortcut)
		get_popup().add_item(String(sub_title[i]))
#		get_popup().set_item_shortcut(i,shortcut,true)

