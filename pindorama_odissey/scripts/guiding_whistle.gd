extends Spatial

onready var next_whistle
onready var whistle =  get_node("whistle")

func _ready():
	pass # Replace with function body.


func play():
	whistle.play()


func stop():
	whistle.stop()
	get_node("wings").play()
	if next_whistle: next_whistle.play()



func _on_Area_body_entered(body):
	if body.name == "player": 
		stop()
