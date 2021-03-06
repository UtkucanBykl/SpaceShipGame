extends RigidBody2D

# class member variables go here, for example:
# var a = 2
var enemyDown = 3
var spawnTime = 0.5
func _ready():
	set_fixed_process(true)
	set_contact_monitor(true)
	set_max_contacts_reported( 5 )



func _fixed_process(delta):

	
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("fire"):
			self.queue_free()
			body.queue_free()
			get_node("/root/World").score += 5
			get_node("/root/World").time = spawnTime
			
			
		if body.get_name() == "Player":
			get_node("/root/World").score -= 5
			self.queue_free()
			get_tree().set_pause(true)
			get_node("/root/World").gameover = "GameOver Point" + str(get_node("/root/World").score) 
	if self.get_pos().y > 500:
		get_node("/root/World").score -= 10
		queue_free()
		get_tree().set_pause(true)
		get_node("/root/World").gameover = "GameOver Point" + str(get_node("/root/World").score) 