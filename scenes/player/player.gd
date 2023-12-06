extends CharacterBody2D

const MAX_SPEED = 100
const ACCELERATION = 500
const FRICTION = 500

@onready var attack_timer = $AttackTimer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@export var BALL = preload("res://scenes/projectiles/snowball.tscn")
@export var min_accuracy = 0.9

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/idle/blend_position", input_vector)
		animation_tree.set("parameters/walk/blend_position", input_vector)
		animation_state.travel("walk")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	if Input.is_action_just_pressed("attack") && attack_timer.is_stopped():
		var ball_direction = self.global_position.direction_to(get_global_mouse_position())
		throw_ball(ball_direction)
	
	
	move_and_slide()
	
func throw_ball(direction: Vector2):
	var rand_accuracy = randf_range(min_accuracy, 1)
	print(rand_accuracy)
	if BALL:
		var ball = BALL.instantiate()
		get_tree().current_scene.add_child(ball)
		ball.global_position = self.global_position
		var rotation = direction.angle()
		ball.rotation = rotation * rand_accuracy
		attack_timer.start()	


func _on_atract_body_entered(body):
	if(body.is_in_group("enemy")):
		print('ai o inimigo')


func _on_atract_body_exited(body):
	pass # Replace with function body.


func _on_atack_body_entered(body):
	pass # Replace with function body.


func _on_atack_body_exited(body):
	pass # Replace with function body.
