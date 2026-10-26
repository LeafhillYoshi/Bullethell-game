extends Node2D

var bulletScene = preload("res://Scenes/bullet.tscn")

var healthStatus = [
	"You're dead",
	"1 / 5",
	"2 / 5",
	"3 / 5",
	"4 / 5",
	"5 / 5"	
]

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(score)
	$Score.text = str(score)
