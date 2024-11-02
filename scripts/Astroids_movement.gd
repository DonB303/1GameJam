extends Area2D

@export var speed = 200
var travelled_distance = 0
var range = 1000

func _physics_process(delta: float) -> void:
	var direction = Vector2.DOWN.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "rocket":
		body.queue_free()
