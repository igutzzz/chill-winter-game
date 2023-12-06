extends CharacterBody2D
var life = 5
@onready var player = $"../Player"
@onready var spawn_area = $"../SpawnArea"

var randomNum

@export var enemyVelocity = Vector2.ZERO
@export var SPEED = 30

enum {
	STAY,
	SURROUND,
	ATTACK,
	HIT,
}

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	randomNum = rng.randf()
	

var state =  STAY

func _physics_process(delta):
	match state:
		SURROUND:
			move(get_circle_position(randomNum), delta)
		ATTACK:
			move(player.global_position, delta)
			
	
	if life == 0:
		queue_free()
		
func move(target, delta):
	var direction = (target - global_position).normalized()
	var desired_velocity = direction * SPEED
	var steering = (desired_velocity - velocity) * delta * 2.5
	velocity +=steering
	move_and_slide()
	
func get_circle_position(random):
	var kill_circle_centre = player.global_position
	var radius = 30
	 #Distance from center to circumference of circle
	var angle = random * PI * 2;
	var x = kill_circle_centre.x + cos(angle) * radius;
	var y = kill_circle_centre.y + sin(angle) * radius;

	return Vector2(x, y)


func _on_area_2d_area_entered(area):
	if(area.collision_layer == 8):
		life -= 1


func enemy_on_area_2d_body_entered(body):
	pass
