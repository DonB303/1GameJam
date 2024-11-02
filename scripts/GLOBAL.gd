extends Node

var score
var player_name : String
var player_list = []

func _ready() -> void:
	SilentWolf.configure({
		"api_key": "XgGh7WKvQha0wM5vPWNzy7aR7tx5QFyv4tkaY5yG",
		"game_id": "MeteorDefender",
		"log_level": 1
	})
	
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})

func leaderboard():
	for score in Global.score:
		Global.player_list.append(Global.player_name)

func _physics_process(delta: float) -> void:
	leaderboard()
