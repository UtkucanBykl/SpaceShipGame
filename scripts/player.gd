extends KinematicBody2D

const addX = 10
const addY = 10
const fire_scene = preload("res://Mini Scenes/Fire.tscn")
func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	var curPos = self.get_pos()

	if event.type == InputEvent.KEY:

		if event.scancode == KEY_RIGHT:

			curPos.x += addX
			self.set_pos(curPos)
			
		elif event.scancode == KEY_LEFT:
			curPos.x -= addX
			self.set_pos(curPos)
			
		elif event.scancode == KEY_SPACE:
			var fire = fire_scene.instance()
			var fire2 = fire_scene.instance()
			fire.set_pos(Vector2(curPos.x-350, curPos.y-260))
			fire2.set_pos(Vector2(curPos.x-450, curPos.y-260))
			get_node("/root/World").add_child(fire)
			fire.add_to_group("fire")
			get_node("/root/World").add_child(fire2)
			fire2.add_to_group("fire")	

