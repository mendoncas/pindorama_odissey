extends Spatial

func _ready():
	get_node("player").speed = 0
	get_node("player").armed = true
	pass # Replace with function body.


func next():
	get_tree().change_scene("res://scenes/cena_3.tscn")
	queue_free()
