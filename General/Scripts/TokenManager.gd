extends Node
var tokens: int = 0
var have_won: bool = false
signal tokens_changed(new_amount: int)

func add_tokens(amount: int) -> void:
	tokens += amount
	print("Tokens added! Current balance: ", tokens)
	tokens_changed.emit(tokens)

func spend_tokens(amount: int) -> bool:
	if tokens >= amount:
		tokens -= amount
		return true 
	return false 
