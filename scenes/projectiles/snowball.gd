extends Area2D

@export var SPEED: int = 200
@export var ACCURACY: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_viewport().get_mouse_position() * ACCURACY
	global_position += SPEED * Vector2.RIGHT.rotated(rotation) * delta 
	pass
	
func destroy():
	queue_free()
	


func _on_area_entered(area):
	destroy()



func _on_body_entered(body):
	destroy()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
