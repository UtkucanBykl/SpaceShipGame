extends Node2D

const enemy_scene = preload("res://Mini Scenes/Enemy.tscn")
const enemyShip_scene = preload("res://Mini Scenes/EnemyShip.tscn")
const ammo_scene = preload("res://Mini Scenes/Ammo.tscn")
var score = 0 setget set_score
var gameover = "" setget set_over
var time = 2 setget set_time


func set_time(value):
	time = value
	var timer = get_node("/root/World/Timer")
	var newTime = timer.get_wait_time() - time
	timer.set_wait_time(newTime)


func set_over(value):
	gameover = value
	get_node("gameover").set_text(gameover)

func set_score(value):
	score = value
	get_node("score").set_text(str(score))
	
func _ready():
	set_fixed_process(true)
	


func _on_Timer_timeout():
	var random = rand_range(1,5)
	if random < 3:
		var enemy = enemyShip_scene.instance()
		enemy.set_pos(Vector2(rand_range(0,800),0))
		enemy.add_to_group("enemy")
		get_node("/root/World").add_child(enemy)
	else:
		var enemy = enemy_scene.instance()
		enemy.set_pos(Vector2(rand_range(0,800),0))
		enemy.add_to_group("enemy")
		get_node("/root/World").add_child(enemy)



func _on_HelpTimer_timeout():
	var addAmmo = ammo_scene.instance()
	addAmmo.set_pos(Vector2(rand_range(0,800),0))
	addAmmo.add_to_group("ammo")
	get_node("/root/World").add_child(addAmmo)
