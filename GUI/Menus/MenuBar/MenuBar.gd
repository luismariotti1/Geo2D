extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuBar.add_child(Abrir, "Abrir");
	$MenuBar.get_popup().add_item("Salvar");	
	$MenuBar.get_popup().add_item("Fechar");


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
