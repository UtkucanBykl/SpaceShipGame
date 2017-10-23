extends KinematicBody2D
var ammo = 30 setget set_ammo
const addX = 20
const addY = 10
const fire_scene = preload("res://Mini Scenes/Fire.tscn")

func set_ammo(value):
	ammo += value

func _ready():
	set_process_input(true)
	set_process(true)

func _process(delta):
	get_node("/root/World/ammo").set_text("Ammo :" + str(ammo))
	var curPos = self.get_pos()
	if Input.is_action_pressed("ui_right"):
		curPos.x += addX
		self.set_pos(curPos)
	if Input.is_action_pressed("ui_left"):
		curPos.x -= addX
		self.set_pos(curPos)
	if Input.is_action_pressed("ui_select"):
		var fire = fire_scene.instance()
		var fire2 = fire_scene.instance()
		print(ammo)
		if ammo > 0:
			fire.set_pos(Vector2(curPos.x-350, curPos.y-260))
			fire2.set_pos(Vector2(curPos.x-450, curPos.y-260))
			get_node("/root/World").add_child(fire)
			fire.add_to_group("fire")
			get_node("/root/World").add_child(fire2)
			fire2.add_to_group("fire")	
			ammo -= 1
			


			