extends Node2D
class_name GameManager

var enemy =  preload("res://scenes/enemies/enemy.tscn")
@onready var spawn = $SpawnArea/CollisionShape2D
@onready var spawn_area = $SpawnArea


@export var player_life: int = 3
@export var enemy_base_life: int = 10
@export var enemy_Count = 5

var hasStar: bool = false
var positions_used = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in enemy_Count:
		var enemyInstance = enemy.instantiate()
		var position = setRandomSpawn(spawn.shape)
		enemyInstance.position = position
		add_child(enemyInstance)
		
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setRandomSpawn(spawn: RectangleShape2D):
	var size_x = spawn.size.x / 2
	var size_y = spawn.size.y / 2 
	var areaPosition = spawn_area.global_position
	var position = Vector2(randf_range(-size_x + areaPosition.x, size_x + areaPosition.x), randf_range(-size_y + areaPosition.y, size_y + areaPosition.y))
	print(position)
	return position
