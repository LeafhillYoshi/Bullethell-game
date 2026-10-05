extends Node2D
var bulletScene = preload("res://Scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_wait_time(1)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Rotation speed.
	rotate(.1)
	self.position.y += 5 * delta

# Code for spawning the bullets.
func spawnBullets() -> void:
	
	var bullet1 = bulletScene.instantiate()
	bullet1.position = self.position
	bullet1.rotation = self.rotation
	
	get_parent().add_child(bullet1)


func _on_timer_timeout() -> void:
	spawnBullets()
	print("Timer Timeout") 
