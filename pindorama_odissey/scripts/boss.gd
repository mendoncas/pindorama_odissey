extends KinematicBody

func _ready():
	pass # Replace with function body.

func _on_snek_timer_timeout():
	if !get_node("snek").playing:
		get_node("snek").play()

func _on_growl_timer_timeout():
	if !get_node("growl").playing:
		get_node("growl").play()

func _on_atack_timer_timeout():
	pass
