extends Node2D

var velocity = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += velocity * delta
	
	if($RayCast2D.is_colliding()):
		print("Hit!")
		queue_free()
		
