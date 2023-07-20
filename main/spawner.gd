extends Control
class_name Spawner

onready var spwn_pos = $HBoxContainer.get_children()
var arrow_tscn = preload("res://rythm_system/arrow.tscn")
#var arrows = ['up','down','left','right']


func spawn_arrow():
	var new_arrow = arrow_tscn.instance()
#	new_arrow.a_name = arrows[1]
	var pos = spwn_pos[randi()%spwn_pos.size()]
	new_arrow.a_name = pos.name
	pos.add_child(new_arrow)
