extends Control

@onready var timer: Timer = $Timer
@onready var label: Label = $Label

var time_in_sec: int = 0
var high_score: String = "00:00:00"  # Default starting high score

func _process(delta: float) -> void:
	if Global.died:
		Global.score = label.text
		timer.stop()
		check_and_update_high_score()

func _on_timer_timeout() -> void:
	time_in_sec += 1
	var m = int(time_in_sec / 3600.0)
	var s = int(time_in_sec / 60.0 - m * 60)
	var ms = time_in_sec - s * 60.0 - m * 3600
	label.text = '%02d:%02d:%02d' % [m, s, ms]
	Global.score = label.text

func check_and_update_high_score() -> void:
	if high_score == "" or Global.score < high_score:
		high_score = Global.score
