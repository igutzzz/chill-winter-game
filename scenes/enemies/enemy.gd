extends CharacterBody2D

var life = 3

func _physics_process(delta):
	if life == 0:
		queue_free()


func _on_area_2d_area_entered(area):
	if(area.collision_layer == 8):
		life -= 1


func enemy_on_area_2d_body_entered(body):
	pass
