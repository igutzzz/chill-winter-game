extends Node2D
class_name GameManager

var enemy =  preload("res://scenes/enemies/enemy.tscn")
@onready var spawn_area = $SpawnArea

@export var player_life: int = 3
@export var enemy_base_life: int = 10
@export var enemy_Count = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	for item in enemy_Count:
		var enemyInstance = enemy.instantiate()
		var position = Vector2(randf_range(300, 400), randf_range(200, 300))
		enemyInstance.position = position
		add_child(enemyInstance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
