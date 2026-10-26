extends Node2D
class_name Enemy

@onready var bulletScene = load("res://Scenes/bullet.tscn")

@onready var player = get_parent().get_parent().get_node("Player")

@export var health = 1

var type = "ENEMY"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_wait_time(2)
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	self.position.y += 100 * delta
	
	if (health == 0):
		get_parent().remove_child(self)
		queue_free()
	
#	if (position.y > get_viewport_rect().size.y + 200):
#		get_parent().remove_child(self)
#		queue_free()

# Code for spawning the bullets.
func spawnBullets() -> void:
	
	var bullet = bulletScene.instantiate()
		
	get_parent().add_child(bullet)
	bullet.bulletSpeed = 800
	bullet.position = self.position
	bullet.direction = Vector2(0, 1)


func _on_timer_timeout() -> void:
	spawnBullets()
