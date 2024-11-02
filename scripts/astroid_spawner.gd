extends Node
@onready var spawn_position: Marker2D = $Marker2D


func spawn():
	const ASTROID = preload("res://Scenes/astroids/astroid.tscn")
	var new_astroid = ASTROID.instantiate()
	new_astroid.global_position = spawn_position
