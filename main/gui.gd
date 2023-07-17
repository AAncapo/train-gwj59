extends Control



func _on_toggle_grass_toggled(button_pressed):
	$"%grass".visible = !button_pressed
