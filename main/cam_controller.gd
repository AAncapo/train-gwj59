extends Spatial
class_name CameraController

onready var train = $"%cam_look_at"
onready var cameras = $cams.get_children()
var current_cam: Camera


func _ready():
	current_cam = cameras[0]


func _process(delta):
	if current_cam:
		current_cam.look_at(train.global_translation, Vector3.UP)


func _on_Timer_timeout():
	if current_cam:
		$Timer.wait_time = 3.0
		var next_cam = cameras[randi()%cameras.size()]
		next_cam.current = true
		current_cam.play_action(true)
		
		current_cam = next_cam
		current_cam.play_action()
