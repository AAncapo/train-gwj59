extends Camera

export (bool) var look_at_train = true
#export (NodePath) var camBase
#onready var cam_base: CameraController = get_node_or_null(camBase)
var look_at_point: Vector3



func play_action(reset = false):
	if !reset && !$AnimationPlayer.is_playing():
		$AnimationPlayer.play("action")
	else:
		$AnimationPlayer.play("RESET")
