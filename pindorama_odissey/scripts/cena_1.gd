extends Spatial

func _ready():
	get_node("whistle1").next_whistle = get_node("whistle2")
	get_node("whistle1").play()


func _on_Area_body_entered(body):
	if body.name == "player": 
		get_node("completed").play()
		get_tree().change_scene("res://scenes/cena_2.tscn")
		queue_free()
