extends KinematicBody

var lpath = preload("res://scenes/label/lab.tscn")
onready var t = $Timer
var direction = Vector3.ZERO
var speed = 250
var can_move = true


func _ready():
	randomize()


func _physics_process(delta):
	stop()
	direction -= global_transform.basis.z if Input.is_action_pressed("forward") else Vector3.ZERO
	direction = move_and_slide(direction * delta * speed) if can_move else Vector3.ZERO
	
	if translation.z <= -19 or translation.z > 17 and $rotate_t.is_stopped():
		g.emit_signal("start")
		can_move = false
		translation.z = -18 if translation.z <= -19 else 17
		$rotate_t.start()
		print(11111)
		
	if not $rotate_t.is_stopped():
		rotation_degrees.y = 180
	#print(translation.z)


func stop():
	direction = Vector3.ZERO


func label_add():
	var l = lpath.instance()
	var pos = Vector2.ZERO
	pos.x = rand_range(50, 800)
	pos.y = rand_range(100, 550)
	add_child(l)
	l.set_global_position(pos)


func _on_Timer_timeout():
	t.wait_time = rand_range(3, 8)
	label_add()


func _on_rotate_t_timeout():
	can_move = true
