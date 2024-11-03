extends Area2D

@export var speed = 200
var travelled_distance = 0
var range = 1000
var die_allowed = true
@onready var canvas_layer: CanvasLayer = $Control/CanvasLayer
@onready var animation_player: AnimationPlayer = $Control/CanvasLayer/VBoxContainer/notification/AnimationPlayer


func _ready() -> void:
	# Setzt die Rotation des Asteroiden auf einen zufälligen Wert zwischen -40 und 40 Grad
	rotation = deg_to_rad(randf_range(-40, 40))

func _physics_process(delta: float) -> void:
	var direction = Vector2.DOWN.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if die_allowed == true:
		if travelled_distance > range:
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Rocket":
		canvas_layer.show()
		Engine.time_scale = 0.000000005
		die_allowed = false


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Paddle":
		queue_free()


func _on_button_pressed() -> void:
	if Global.reged == true:
		get_tree().change_scene_to_file("res://Scenes/leader_board.tscn")
	else:
		animation_player.play("notifi")



func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
