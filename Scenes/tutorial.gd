extends Node2D
@onready var timer_1: Timer = $Node2D/Timer1
@onready var timer_2: Timer = $Node2D2/Timer2

@onready var cam_1: Camera2D = $Node2D/Cam1
@onready var cam_2: Camera2D = $Node2D2/Cam2
@onready var cam_3: Camera2D = $Node2D3/Cam3

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var label: Label = $Node2D3/CanvasLayer/Label
@onready var label_2: Label = $Node2D3/CanvasLayer/Label2



func _on_timer_1_timeout() -> void:
	cam_1.enabled = false
	cam_2.enabled = true
	timer_2.start()
	animation_player.play("cursor")


func _on_timer_2_timeout() -> void:
	cam_2.enabled = false
	cam_3.enabled = true
	Global.astroids_run = true
	animation_player.play("text")





func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "text":
		get_tree().change_scene_to_file("res://Scenes/test.tscn")
