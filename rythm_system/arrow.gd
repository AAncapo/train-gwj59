extends KinematicBody2D

export (float) var speed = 320.0
var a_name: String

func _ready():
	$TextureRect.texture = load(str("res://gui/button_icons/a",a_name[0],".png"))

func _physics_process(delta):
	move_and_slide(Vector2.DOWN * speed,Vector2.UP)
