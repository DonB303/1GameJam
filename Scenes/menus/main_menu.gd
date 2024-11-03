extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var pitch_scale_plus = randf_range(0.005, 0.05)
var minus_oder_pluss = randf_range(1, 2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if minus_oder_pluss > 1:
		audio_stream_player_2d.pitch_scale += pitch_scale_plus
	if minus_oder_pluss < 1:
		audio_stream_player_2d.pitch_scale -= pitch_scale_plus


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test.tscn")

func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
