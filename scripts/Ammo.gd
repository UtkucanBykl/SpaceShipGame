extends RigidBody2D

var ammoDown = 1

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
			get_node("/root/World/Player").ammo = 5
			
			
		if body.get_name() == "Player":
			get_node("/root/World").score -= 5
			self.queue_free()
	if self.get_pos().y > 500:
		queue_free()

