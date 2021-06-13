extends Spatial

var hit = 0
var fighting = false
onready	var op_left = get_node("player/left_op")
onready	var op_right = get_node("player/right_op")
onready	var hit_left = get_node("player/left_hit")
onready	var hit_right = get_node("player/right_hit")
onready var try = get_node("player/try")


func _ready():
	get_node("player").speed = 0
	get_node("player").armed =false
	get_node("intro").play()
	get_node("Path/PathFollow/boss/snek_timer").start()
	get_node("Path/PathFollow/boss/growl_timer").start()



func _on_timer_timeout():
	if fighting:
		if (randi() % 100) >= 50:
			op_left.play()
		
		else:
			op_right.play()


func _physics_process(delta):
	if op_left.playing:
		if Input.is_action_just_pressed("left"):
			try.play()
			hit_left.play()

	elif op_right.playing:
		if Input.is_action_just_pressed("right"):
			try.play()
			hit_right.play()

	if hit == 4 :
		get_node("Path/PathFollow/boss").die()


func _on_intro_finished():
	fighting = true
	get_node("Path/PathFollow/boss").present = true
	get_node("player").armed = true
	get_node("timer").start()
