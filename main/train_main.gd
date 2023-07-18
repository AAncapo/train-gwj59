extends Spatial



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "start":
		$AnimationPlayer.play("bounce")
