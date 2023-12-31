extends Node2D
class_name GameManager

var enemy =  preload("res://scenes/enemies/enemy.tscn")
@onready var spawn = $SpawnArea/CollisionShape2D
@onready var spawn_area = $SpawnArea
@onready var player = $Player




@export var player_life: int = 3
@export var playerPath = NodePath()
@export var enemy_base_life: int = 10
@export var enemy_Count = 5
@export var enemy_radius = 10

@onready var playerNode = get_node(playerPath)

var hasStar: bool = false
var positions_used = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in enemy_Count:
		var enemyInstance = enemy.instantiate()
		var position = setRandomSpawn(spawn.shape)
		enemyInstance.position = position
		enemyInstance.player = playerNode
		enemyInstance.life = enemy_base_lifes
		add_child(enemyInstance)
	
		
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setRandomSpawn(spawn: RectangleShape2D):
	var size_x = spawn.size.x / 2
	var size_y = spawn.size.y / 2 
	var areaPosition = spawn_area.global_position
	var position = Vector2(randf_range(-size_x + areaPosition.x, size_x + areaPosition.x), randf_range(-size_y + areaPosition.y, size_y + areaPosition.y))
	
	#for item in positions_used:
		#var x = range()
	
	var savePosition = Vector2(position.x+enemy_radius, position.y+enemy_radius)
	positions_used.append(savePosition)
	return position

