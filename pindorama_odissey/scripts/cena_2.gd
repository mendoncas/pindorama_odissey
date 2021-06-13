extends Spatial

func _ready():
	get_node("player").speed = 0
	get_node("intro").play()


func next():
	get_tree().change_scene("res://scenes/cena_3.tscn")
	queue_free()


func _on_intro_finished():
	get_node("player").armed = true
