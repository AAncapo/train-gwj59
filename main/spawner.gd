extends HBoxContainer
class_name Spawner

var arrow_tscn = preload("res://rythm_system/arrow.tscn")
var arrows = ['up','down','left','right']

func spawn_arrow():
	var new_arrow = arrow_tscn.instance()
	new_arrow.a_name = arrows[0]
	$Control/Spawner.add_child(new_arrow)
	arrows.shuffle()
