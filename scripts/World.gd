extends Node2D

const enemy_scene = preload("res://Mini Scenes/Enemy.tscn")
var score = 0 setget set_score
var gameover = "" setget set_over

func set_over(value):
	gameover = value
	get_node("gameover").set_text(gameover)

func set_score(value):
	score = value
	get_node("score").set_text(str(score))
	
func _ready():
	set_fixed_process(true)
	


func _on_Timer_timeout():
	var enemy = enemy_scene.instance()
	enemy.set_pos(Vector2(rand_range(0,500),0))
	enemy.add_to_group("enemy")
	get_node("/root/World").add_child(enemy)
