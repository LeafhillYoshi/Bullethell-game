extends Node2D

var direction = Vector2(1, 0)
@export var bulletSpeed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	self.position += direction * delta * bulletSpeed
	
	if($RayCast2D.is_colliding()):
		var collider = $RayCast2D.get_collider().get_parent()
		if (collider.type == "PLAYER"):
			print("Hit!")
			position += Vector2(2000, 2000)
			if (collider.health > 0):
				collider.health -= 1
				print(collider.health)
				collider.updateStatus()
		
func screenExcited() -> void:
	get_parent().remove_child(self)
	queue_free()
