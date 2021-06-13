extends Spatial

func _ready():
	get_node("whistle1").next_whistle = get_node("whistle2")


func _on_Area_body_entered(body):
	if body.name == "player": 
		get_node("completed").play()


func _on_intro_finished():
	get_node("whistle1").play()


func _next():
	get_tree().change_scene("res://scenes/cena_2.tscn")
	queue_free()


func _on_completed_finished():
	_next()


func _on_hist_finished():
	get_node("intro").play()
