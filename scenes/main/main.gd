extends Spatial

var event_count = 0
var s = g.phrases
var ss = 0


func _ready():
	g.connect("start", self, "event_start")
	for i in s:
		printt(ss)
		ss += 1


func event_start():
	event_count += 1
