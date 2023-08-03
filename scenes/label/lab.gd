extends Label


func _ready():
	var x = rand_range(0, 26)
	text = g.phrases[x]


func _on_Timer_timeout():
	queue_free()
