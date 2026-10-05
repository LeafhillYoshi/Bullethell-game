extends Node2D

var bulletScene = preload("res://Scenes/bullet.tscn")

##func _on_player_shoot(bulletScene, direction, location):



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_shoot(bullet: Variant, direction: Variant, location: Variant) -> void:
	var spawnedBullet = bulletScene.instantiate()
	add_child(spawnedBullet)
	spawnedBullet.rotation = direction
	spawnedBullet.position = location
	spawnedBullet.velocity = spawnedBullet.velocity.rotated(direction)
