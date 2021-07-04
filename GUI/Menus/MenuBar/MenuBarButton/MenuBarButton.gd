extends MenuButton


var _title
var _id: int

func init(id, title,tamanho, sub_title):
	_id = id
	_title = title
	text = title
	
	for i in range(tamanho):
		get_popup().add_item(String(sub_title[i]))

