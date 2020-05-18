extends Spatial

signal level_selected(filename, difficulty, level_number)


var song_list = []
var page = 0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func update_song_list():
	var offset = page * 6
	var idx
	for idx in range(6):
		if len(song_list) > idx+offset:
			var filename = song_list[idx+offset]
			var song_name = filename.rsplit(".")[0].rsplit("/")[-1]
			get_node("SongBlocks/Element%d"%(idx+1)).set_song_info(song_name,filename)
		else:
			get_node("SongBlocks/Element%d"%(idx+1)).set_song_info("empty",null)


func set_songs(songs):
	song_list = songs
	update_song_list()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_song_list()
	pass # Replace with function body.





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_level_block_selected(filename, difficulty, level_number):
	emit_signal("level_selected", filename, difficulty, level_number)
