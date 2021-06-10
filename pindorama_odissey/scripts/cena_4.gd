extends Spatial

var hit = 0
onready	var op_left = get_node("player/left_op")
onready	var op_right = get_node("player/right_op")
onready	var hit_left = get_node("player/left_hit")
onready	var hit_right = get_node("player/right_hit")
onready var try = get_node("player/try")


func _ready():
	get_node("player").speed = 0
	get_node("player").armed = true

func _on_timer_timeout():
	if (randi() % 100) >= 50:
		op_left.play()
		
	else:
		op_right.play()


func _physics_process(delta):
	if op_left.playing:
		if Input.is_action_just_pressed("left"):
			try.play()
			hit_left.play()
			hit+=1

	elif op_right.playing:
		if Input.is_action_just_pressed("right"):
			try.play()
			hit_right.play()
			hit+=1

	if hit == 4 :
		# print("você perdeu!")
		# queue_free()
		pass


