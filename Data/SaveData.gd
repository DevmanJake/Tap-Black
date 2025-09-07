extends Node

var high_scores = []
var coins = 0
var owned_cosmetics = []
var equipped_skin = "default"

func save_score(score, new_coins):
	coins += new_coins
	high_scores.append(score)
	high_scores.sort()
	high_scores = high_scores.reverse()
	if high_scores.size() > 10:
		high_scores.resize(10)
	_save()

func _save():
	var save = {
		"scores": high_scores,
		"coins": coins,
		"cosmetics": owned_cosmetics,
		"equipped": equipped_skin
	}
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(save))
	file.close()

func load_data():
	if FileAccess.file_exists("user://savegame.json"):
		var file = FileAccess.open("user://savegame.json", FileAccess.READ)
		var data = JSON.parse_string(file.get_as_text())
		if typeof(data) == TYPE_DICTIONARY:
			high_scores = data.get("scores", [])
			coins = data.get("coins", 0)
			owned_cosmetics = data.get("cosmetics", [])
			equipped_skin = data.get("equipped", "default")
