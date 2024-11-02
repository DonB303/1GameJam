extends Node

@onready var spawn_position: Marker2D = $Marker2D
@onready var spawn_timer: Timer = $spawn_timer
@onready var wave_timer: Timer = $wave_timer

const ASTEROID = preload("res://Scenes/astroids/astroid.tscn")

func spawn():
	var new_asteroid = ASTEROID.instantiate()
	new_asteroid.global_position = spawn_position.global_position
	get_parent().add_child(new_asteroid) 

func _on_spawn_timer_timeout() -> void:
	spawn()

func _on_wave_timer_timeout() -> void:
	spawn_timer.wait_time = max(0.1, spawn_timer.wait_time - 0.25) 
	wave_timer.wait_time += 30
