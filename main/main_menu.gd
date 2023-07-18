extends Control


func toggle_display(display):
	get_tree().paused = display
	visible = display
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if display else Input.MOUSE_MODE_CAPTURED
	
	if !display:
		$"%Intro".hide()

func _on_play_pressed():
	toggle_display(!visible)

func _on_options_pressed():
	$"%options_menu".show()

func _on_exit_pressed():
	get_tree().quit()

