extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_LinkLuis_pressed():
	OS.shell_open("https://github.com/luismariotti1")


func _on_LinkEberson_pressed():
	OS.shell_open("https://github.com/Eb3r-r00t")


func _on_LinkDiego_pressed():
	OS.shell_open("https://github.com/Srdiegoibs")
