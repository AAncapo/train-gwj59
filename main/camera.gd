extends Spatial

func _ready():
	Input.mouse_mode =Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.05
