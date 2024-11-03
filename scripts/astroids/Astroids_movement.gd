extends Area2D

@export var speed = 200
var travelled_distance = 0
var range = 1000

func _ready() -> void:
	# Setzt die Rotation des Asteroiden auf einen zufälligen Wert zwischen -40 und 40 Grad
	rotation = deg_to_rad(randf_range(-40, 40))

func _physics_process(delta: float) -> void:
	var direction = Vector2.DOWN.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "rocket":
		body.queue_free()

func _on_area_entered(area: Area2D) -> void:
	queue_free()
