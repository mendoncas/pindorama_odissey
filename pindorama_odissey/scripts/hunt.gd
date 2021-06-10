extends KinematicBody

func _ready():
	pass # Replace with function body.

func hit():
	get_node("hit").play()
	get_node("hit2").play()
	get_node("heartbeat").stop()
	get_node("/root/cena_2").next()
