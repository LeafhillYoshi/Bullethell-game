extends CharacterBody2D
class_name Player

var type = "PLAYER"
var health = 5
@export var speed = 400
var playerBullet = load("res://Scenes/playerBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#Functions handling input
func getMovementInput(speed):
	speed = speed
	var inputDirection = Input.get_vector("left", "right", "up", "down")
	velocity = inputDirection * speed


func _process(delta: float) -> void:
	
	getMovementInput(speed)
	move_and_slide()
	
	if (health == 0):
		get_parent().remove_child(self)

#	self.position = get_global_mouse_position()

	if (Input.is_action_just_pressed("shoot")):
		var bullet = playerBullet.instantiate()
		get_parent().add_child(bullet)
		bullet.position = self.position


func updateStatus() -> void:
	get_parent().get_node("HealthMeter").text = get_parent().healthStatus[health]
