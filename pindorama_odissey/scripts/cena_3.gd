extends Spatial

var hit = 0
var miss = 0
var running = false
var safe = false
onready	var op_left = get_node("left_op")
onready	var op_right = get_node("right_op")
onready	var hit_left = get_node("left_hit")
onready	var hit_right = get_node("right_hit")
onready var try = get_node("try")

func _ready():
	get_node("intro").play()
	get_node("player").speed = 0


func _on_timer_timeout():
	if running:
		if (randi() % 100) >= 50:
			get_node("left_op").play()
		
		else:
			get_node("right_op").play()


func _physics_process(delta):
	if op_left.playing:
		if Input.is_action_just_pressed("right"):
			try.play()
			hit_left.play()
			hit+=1
			safe = true

	elif op_right.playing:
		if Input.is_action_just_pressed("left"):
			try.play()
			hit_right.play()
			hit+=1	
			safe = true

	if hit == 7:
		next()


func next():
	running = false
	get_node("player/running").stop()
	if !get_node("outro").playing:
		get_node("outro").play()
		get_node("ship").play()


func _on_intro_finished():
	running = true
	get_node("player/running").play()


func _on_right_op_finished():
	if !safe:
		miss+=1
		print("você recebeu daano")
	safe = false


func _on_left_op_finished():
	if !safe:
		miss+=1
		print("você recebeu daano")
	safe = false


func _on_outro_finished():
	get_tree().change_scene("res://scenes/cena_4.tscn")
	queue_free()
