extends Control

onready var vplayer = $VideoPlayer
var pp_icons = [
	preload("res://youtube_zapping/icons/play.png"),
	preload("res://youtube_zapping/icons/pause.png")
	]
var is_playing: bool = false

func _on_play_toggled(button_pressed):
	is_playing = button_pressed
	if button_pressed && vplayer.stream_position == 0.0:
		vplayer.play()
		return
	vplayer.paused = !button_pressed


func _on_VideoPlayer_gui_input(event):
	if event is InputEventMouseButton && event.is_pressed():
		_on_play_toggled(!is_playing)
