extends Path

onready var caminho = get_node("PathFollow")

func _process(delta):
	caminho.set_offset(caminho.get_offset() - 0.1)
