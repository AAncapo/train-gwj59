extends TextureRect

signal action

onready var time_label: Label = $"%time"
onready var vprogress_bar: ProgressBar = $"%ProgressBar"
onready var grabber: KinematicBody2D = $"%grabber"
var timestamp = preload("res://youtube_zapping/timestamp.tscn")


func update_progress(current_stream_pos, stream_length):
	## TODO: convert to mm:ss
	time_label.text = str('  ',current_stream_pos,' / ', stream_length)
	
	vprogress_bar.max_value = stream_length
	vprogress_bar.value = current_stream_pos
	
	grabber.position.x = vprogress_bar.value * (vprogress_bar.rect_size.x/stream_length)


func spawn_timestamps(stream_length):
	var positions = [35.00, 40.10, 45.70, 50.00, 99.00]
	for pos in positions:
		var new_ts = timestamp.instance()
		$"%timestamps".add_child(new_ts)
		connect("action",new_ts,"is_success")
		new_ts.rect_position.x = pos * (vprogress_bar.rect_size.x/stream_length)


## Window control buttons ##
func _on_close_pressed():
	get_tree().quit()

func _on_minimize_pressed():
	OS.window_minimized = true

func _on_resize_pressed():
#	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.
