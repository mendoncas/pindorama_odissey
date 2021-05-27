extends KinematicBody

var mouse_sensitivity = 0.105
var speed = 30
onready var head = get_node("Head")

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x *mouse_sensitivity))
		head.rotate_x(deg2rad(-event.relative.y*mouse_sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-180), deg2rad(90))


func _physics_process(delta):
	direction = Vector3()
	if Input.is_action_pressed("forward"):
		direction -= transform.basis.z

	elif Input.is_action_pressed("backward"):
		direction += transform.basis.z

	if Input.is_action_pressed("right"):
		direction+= transform.basis.x
	
	elif Input.is_action_pressed("left"):
		direction -= transform.basis.x

	direction = direction.normalized()
	move_and_slide(direction * speed, Vector3.UP)
