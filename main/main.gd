extends Spatial

var _fps: float

func _process(delta):
	_fps = Engine.get_frames_per_second()
	$GUI/fps.text = str('fps: ', _fps)
