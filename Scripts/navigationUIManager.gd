extends Tree

@onready var settings = $Settings
@onready var edft = $EDFT
@onready var edfo = $EDFO

@onready var tabs = [
	settings,
	edft,
	edfo
]
@onready var tab_bar = $"../TabContainer/TabBar"

# Called when the node enters the scene tree for the first time.
func _ready():
	tab_bar.current_tab = Global.current_tab


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	settings.visible = tab_bar.current_tab == 0
	edft.visible = tab_bar.current_tab == 1
	edfo.visible = tab_bar.current_tab == 2
	
	Global.current_tab = tab_bar.current_tab
