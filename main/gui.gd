extends Control

onready var option_menu = $options_menu
onready var main = $main_menu


func _ready():
	main.toggle_display(true)


func _unhandled_input(event):
	if event.is_action_pressed("exit"):
		main.toggle_display(!main.visible)
