extends Node2D

var bullet_scene = preload("res://Scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Rotation speed.
	rotate(.1)
	
	# Code for spawning the bullets.
	var bullet = bullet_scene.instantiate()
	bullet.position = self.position
	bullet.rotation = self.rotation
	# Offset the bullet for debugging
	#bullet.position.x += 100
	get_parent().add_child(bullet)
