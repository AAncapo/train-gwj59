extends Spatial

export (Array, AudioStreamOGGVorbis) var voices
onready var asp: AudioStreamPlayer = $AudioStreamPlayer


func play_voice():
	if !voices.empty() && !asp.playing:
		asp.stream = voices[randi()%voices.size()]
		asp.play()
