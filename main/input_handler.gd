extends HBoxContainer

onready var slots = get_children()
onready var anim = $"%scoreAnim"
onready var train_honk = $"%AudioStreamPlayer3D"
onready var guy = $"%guy"

func _ready():
	randomize()
	for s in slots:
		s.connect('failed', self,"_on_a_slot_failed")


func _input(event):
	if event is InputEventKey && event.is_pressed():
		if (event.is_action("down") || event.is_action("left") 
		|| event.is_action("right")):
			var input_name = event.as_text().to_lower()
			
			train_honk.play()
			
			if get_slot_response(input_name):
				anim.play("success")
				
#				if randf() > 0.3:
				guy.play_voice()
				return
			anim.play("fail")


func get_slot_response(input_name):
	var succeed = false
	for slot in slots:
		if slot.is_success(input_name):
			succeed = true
	return succeed


func _on_a_slot_failed():
	anim.play("fail")
