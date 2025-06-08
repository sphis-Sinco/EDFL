extends CheckBox


# Called when the node enters the scene tree for the first time.
func _ready():
	
	connect('toggled', toggled)

func toggled(toggled_on):
	print(toggled_on)
	Global.close_launcher_on_start = toggled_on
	print(Global.close_launcher_on_start)
