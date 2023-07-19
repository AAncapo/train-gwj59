extends Control


func toggle_display(display):
	get_tree().paused = display
	visible = display
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if display else Input.MOUSE_MODE_CAPTURED
	$"%Board".visible = !display
	$VBoxContainer/retry.disabled = !Global.game_started


func _on_play_pressed():
	toggle_display(!visible)
	Global.game_started = true

func _on_options_pressed():
	$"%options_menu".show()

func _on_exit_pressed():
	get_tree().quit()


func _on_retry_pressed():
	get_tree().reload_current_scene()
	$VBoxContainer/play.emit_signal("pressed") ##TODO: NOT WORKING
