extends Node
var tokens: int = 0
var FP_score : int = 0
signal tokens_changed(new_amount: int)
var in_packbro: bool = false
var in_slime_quest: bool = false
var planet_raiders_won: bool = false
var enemies_shooting: bool = true
var pack_bro_won: bool = false
var slime_quest_won: bool = false
var enemies_spawning: bool = true
var flying_parrot_won: bool = false
var four_tokens: bool = false

func add_tokens(amount: int) -> void:
	tokens += amount
	print("Tokens added! Current balance: ", tokens)
	tokens_changed.emit(tokens)

func spend_tokens(amount: int) -> bool:
	if tokens >= amount:
		tokens -= amount
		return true 
	return false 
