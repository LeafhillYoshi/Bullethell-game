extends Node2D

var direction = Vector2(0, 1)
@export var bulletSpeed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	self.position -= direction * delta * bulletSpeed
	
	if($RayCast2D.is_colliding()):
		var target = $RayCast2D.get_collider().get_parent()
		if (target.type == "ENEMY"):
			print("Hit!")
			queue_free()
			if (target.health > 0):
				target.health -= 1
				updateScore()
	
func updateScore() -> void:
	get_parent().score += 50
	
  
func screenExcited() -> void:
	get_parent().remove_child(self)
	queue_free()
