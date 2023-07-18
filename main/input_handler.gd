extends HBoxContainer

onready var slot = $up_button_texture/a_slot
onready var anim = $"%scoreAnim"


func _input(event):
	if event is InputEventKey && event.is_pressed():
		if (event.is_action("down") || event.is_action("left") 
		|| event.is_action("right") || event.is_action("up")):
			var input_name = event.as_text().to_lower()
			if slot.is_success(input_name):
				anim.play("success")
				return
			anim.play("fail")


func _on_a_slot_failed():
	anim.play("fail")
