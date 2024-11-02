extends Node2D

@onready var spawn_position: Marker2D = $Marker2D
@onready var spawn_timer: Timer = $spawn_timer
@onready var wave_timer: Timer = $wave_timer

func spawn():
	const ASTROID = preload("res://Scenes/astroids/astroid.tscn")
	var new_astroid = ASTROID.instantiate()
	new_astroid.global_position = spawn_position.global_position
	spawn_position.add_child(new_astroid)

func _on_spawn_timer_timeout() -> void:
	spawn()
	spawn_timer.start()

func _on_wave_timer_timeout() -> void:
	spawn_timer.wait_time -= 0.25
	wave_timer.wait_time += 30
