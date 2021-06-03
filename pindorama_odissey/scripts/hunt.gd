extends KinematicBody

func _ready():
	pass # Replace with function body.

func hit():
	get_node("hit").play()
	get_node("heartbeat").stop()
