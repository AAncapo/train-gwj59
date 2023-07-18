extends Area2D

var catched: bool = false
signal failed

func is_success(input_name: String):
	var obs = get_overlapping_bodies()
	if !obs.empty() && obs[0].a_name == input_name:
		catched = true
		return true
	return false


func _on_a_slot_body_exited(body):
	if !catched:
		emit_signal("failed")
	body.queue_free()
	catched = false
