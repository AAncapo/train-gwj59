extends AudioStreamPlayer

signal beat(position)
signal meassure(position)

export var bpm := 100
export var meassures := 4

## tracking the beat and song positions ##
var song_pos = 0.0
var song_pos_in_beats = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var measure = 1

## determining how close to the beat an event is ##
var closest = 0
var time_off_beat = 0.0
onready var spawner = $"%spwner"
var spawned = false

func _physics_process(delta):
	if playing:
		song_pos = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_pos -= AudioServer.get_output_latency()
#		song_pos_in_beats = int(floor(song_pos / sec_per_beat)) + beats_before_start
#		_report_beat()


func _report_beat():
	if last_reported_beat < song_pos_in_beats:
		if measure > meassures:
			measure = 1
		emit_signal("beat",song_pos_in_beats)
		emit_signal("meassure",measure)
		last_reported_beat = song_pos_in_beats
		measure += 1
