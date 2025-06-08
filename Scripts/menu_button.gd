extends Button

@export var scene_path:String = 'Main'
@export var launch = true

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", clicked_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clicked_button():
	Global.launch_game = launch
	get_tree().change_scene_to_file("res://Scenes/"+scene_path+".tscn")
