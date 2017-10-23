extends RigidBody2D


# class member variables go here, for example:
# var a = 2
var health = 2

func _ready():
	set_fixed_process(true)
	set_contact_monitor(true)
	set_max_contacts_reported( 5 )
	
func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("fire"):
			body.queue_free()
			health -= 1
			if health <= 0:
				self.queue_free()
				get_node("/root/World").score +=20
				
		if body.get_name() == "Player":
			get_node("/root/World").score -= 5
			self.queue_free()
			get_tree().set_pause(true)
			get_node("/root/World").gameover = "GameOver Point" + str(get_node("/root/World").score) 
	if self.get_pos().x>900 or self.get_pos().x<0:
		queue_free()
	if self.get_pos().y > 500:
		get_node("/root/World").score -= 10
		queue_free()
		get_tree().set_pause(true)
		get_node("/root/World").gameover = "GameOver Point" + str(get_node("/root/World").score) 
			
