extends CharacterBody2D

@export var speed: int = 400
signal shoot(bullet, direction, location)

var bulletScene = preload("res://Scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_wait_time(1)
	$Timer.start()


## func spawnBullets() -> void:
##	
##	var bullet = bulletScene.instantiate()
##	bullet.position = self.position
##	bullet.dir = Vector2(0, -2)
##	# Offset the bullet for debugging
##	bullet.position.y += -50
##	# if Input.is_action_just_pressed("shoot"):
##	#	get_parent().add_child(bullet)
##	
##	if Input.is_action_just_pressed("shoot"):
##		get_parent().add_child(bullet)

#Functions handling input
func getMovementInput():
	var inputDirection = Input.get_vector("left", "right", "up", "down")
	velocity = inputDirection * speed

func getShootingInput(event):
	if event is InputEventKey:
		if event.button_index == KEY_SPACE and event.pressed:
			shoot.emit(bulletScene, rotation, position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	getMovementInput()
	move_and_slide()

func _process(delta: float) -> void:
	# spawnBullets()
	pass


func _on_timer_timeout() -> void:
	pass
