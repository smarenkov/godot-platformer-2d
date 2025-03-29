class_name UIManager extends CanvasLayer

@onready var level_manager: LevelManager = %LevelManager
@onready var coin_count_label: Label = $CoinCountLabel


func _ready() -> void:
	_update_coint_count_label()

func _on_level_manager_coin_pick_up() -> void:
	print("_on_level_manager_coin_pick_up")
	_update_coint_count_label()
	
func _update_coint_count_label() -> void:
	coin_count_label.text = "Coins collected: " + str(level_manager.coin_count)	
