extends KinematicBody2D

const fireY = 10

func _ready():
	set_fixed_process(true)


func  _fixed_process(delta):

	var curPosFire = self.get_pos()
	curPosFire.y -= fireY
	self.set_pos(curPosFire)
	if curPosFire.y < -400:
		queue_free()