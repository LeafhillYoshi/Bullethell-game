extends Node2D

@onready var enemy_scene = load("res://Scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_wait_time(1)
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	randomize()
	enemy.position.x = randf_range(200, 1000)
	enemy.position.y = -100
	add_child(enemy)
