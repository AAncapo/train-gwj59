extends Control

signal failed
var catched: bool = false


func is_success():
	var ob = $Area2D.get_overlapping_bodies()
	if !ob.empty():
		catched = true
		show_score('Good!')
		return true
	return false


func show_score(_text):
	$scoreLabel.text = _text
	$AnimationPlayer.play("display_score")


func _on_Area2D_body_exited(body):
	if !catched:
		emit_signal("failed")
		show_score('Bad')
