extends Label

@export var game_name = 'EDFT'
@export var config_url:String

var game_version = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	# Fetch config
	event("FETCHING_CONFIG")
	var latest_config:Variant = await Launcher.download_to_json_variant(config_url)
	
	# Ensure config received
	if latest_config == null:
		event("FAILED_FETCH_CONFIG")
		return
	#end
	
	# Get current config
	var current_config:Variant = Launcher.File.read_json(Launcher.game_path+'/'+game_name+'/'+Launcher.config_path)
	
	# Get current version number
	var current_version:String = ""
	if current_config != null:
		current_version = current_config.get("version")
		if current_version == null:
			event("MISSING_VERSION")
			return
		#end
	#end
	
	# Get latest version number
	var latest_version:String = latest_config.get("version")
	if latest_version == null:
		event("MISSING_VERSION")
		return
	#end
	
	game_version = current_version
	
	# Download latest version if outdated
	if current_version != latest_version:
		print(game_name+' OUTDATED VERSION ('+current_version+'!='+latest_version+')')
		event("OUTDATED_VERSION")
	else:
		event("UPTODATE_VERSION")
	

func event(event:String):
	print(game_name+' called '+event)
	
	text = game_name
	var ver = ' v'+game_version
	
	if game_version == '':
		ver = ''
	
	match event:
		"FETCHING_CONFIG":
			text += ' (FETCHING CONFIG)'
		"FAILED_FETCH_CONFIG":
			text += ' (COULD NOT FETCH CONFIG)'
		"MISSING_VERSION":
			text += ' (NOT DOWNLOADED)'
		"OUTDATED_VERSION":
			text += ver+' (OUTDATED)'
		"UPTODATE_VERSION":
			text += ver+' (UP TO DATE)'
