extends Control

const VSTREAM_LENGTH: float = 147.93 #excited train guy video

onready var page = $page
onready var vplayer:VideoPlayer = $"%VideoPlayer"


func _ready():
	page.spawn_timestamps(VSTREAM_LENGTH)
#	vplayer.rect_size.x = vplayer.get_video_texture().get_width()/2.0
	pass


func _process(delta):
	page.update_progress(vplayer.stream_position, VSTREAM_LENGTH)


func _input(event):
	if event.is_action("action") && event.is_pressed():
		page.emit_signal("action")
