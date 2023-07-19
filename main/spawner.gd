extends Control
class_name Spawner

onready var spwn_pos = $HBoxContainer.get_children()
var arrow_tscn = preload("res://rythm_system/arrow.tscn")
var arrows = ['up','down','left','right']


func spawn_arrow():
	var new_arrow = arrow_tscn.instance()
	new_arrow.a_name = arrows[0]
	for spwn_node in spwn_pos:
		if spwn_node.name == new_arrow.a_name:
			spwn_node.add_child(new_arrow)
	arrows.shuffle()
