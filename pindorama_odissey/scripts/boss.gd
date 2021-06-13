extends KinematicBody

var present = false
var hit = 0
func _ready():

	pass # Replace with function body.

func _on_snek_timer_timeout():
	if !get_node("snek").playing and present:
		get_node("snek").play()

func _on_growl_timer_timeout():
	if !get_node("growl").playing and present:
		get_node("growl").play()

func _on_atack_timer_timeout():
	pass

func hit():
	get_node("growl").stop()
	get_node("growl").play()
	get_node("hit").play()
	hit += 1
	if hit == 3:
		die()


func die():
	get_tree().quit()
