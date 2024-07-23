extends Node

const INF = 1e10

# Board dimensions
const ROWS = 6
const COLS = 7

# Function to evaluate the board for a given player
func evaluate_board(board, player):
	var score = 0
	# Add custom evaluation logic for Connect 4
	# You can evaluate based on the number of discs in a row, column, or diagonal
	return score

# Function to get all possible moves (valid columns)
func get_possible_moves(board):
	var moves = []
	for col in range(COLS):
		if board[0][col] == "blue":  # If the top cell in the column is empty, it's a valid move
			moves.append(col)
	return moves

# Minimax algorithm with alpha-beta pruning
func minimax(board, depth, isMaximizingPlayer, alpha, beta, player):
	if game_over(board) or depth == 0:
		return score_board(board, player)
	
	if isMaximizingPlayer:
		var maxEval = -INF
		for move in get_possible_moves(board):
			var new_board = apply_move(board, move, player)
			var eval = minimax(new_board, depth - 1, false, alpha, beta, player)
			maxEval = max(maxEval, eval)
			alpha = max(alpha, eval)
			if beta <= alpha:
				break
		return maxEval
	else:
		var minEval = INF
		for move in get_possible_moves(board):
			var new_board = apply_move(board, move, get_opponent(player))
			var eval = minimax(new_board, depth - 1, true, alpha, beta, player)
			minEval = min(minEval, eval)
			beta = min(beta, eval)
			if beta <= alpha:
				break
		return minEval

# Function to apply a move to the board
func apply_move(board, col, player):
	var new_board = []
	for row in board:
		new_board.append(row.duplicate())
	for i in range(ROWS - 1, -1, -1):
		if new_board[i][col] == "blue":
			new_board[i][col] = player
			break
	return new_board

# Function to check if the game is over
func game_over(board):
	return check_win(board, "red") or check_win(board, "yellow") or board_full(board)

# Function to check if a player has won
func check_win(board, player):
	# Check horizontal, vertical, and diagonal lines for a win
	for row in range(ROWS):
		for col in range(COLS - 3):
			if board[row][col] == player and board[row][col + 1] == player and board[row][col + 2] == player and board[row][col + 3] == player:
				return true

	for col in range(COLS):
		for row in range(ROWS - 3):
			if board[row][col] == player and board[row + 1][col] == player and board[row + 2][col] == player and board[row + 3][col] == player:
				return true

	for row in range(ROWS - 3):
		for col in range(COLS - 3):
			if board[row][col] == player and board[row + 1][col + 1] == player and board[row + 2][col + 2] == player and board[row + 3][col + 3] == player:
				return true

	for row in range(3, ROWS):
		for col in range(COLS - 3):
			if board[row][col] == player and board[row - 1][col + 1] == player and board[row - 2][col + 2] == player and board[row - 3][col + 3] == player:
				return true

	return false

# Function to check if the board is full
func board_full(board):
	for row in board:
		if "blue" in row:
			return false
	return true

# Function to score the board
func score_board(board, player):
	if check_win(board, player):
		return INF
	elif check_win(board, get_opponent(player)):
		return -INF
	else:
		return evaluate_board(board, player)

# Function to get the opponent
func get_opponent(player):
	return "red" if player == "yellow" else "yellow"

# Function to print the board
func print_board(board):
	for row in board:
		print(row)

# Function to update the GUI (not needed in this version)
func update_gui(board, move, eval):
	pass

# Function to get the best move for the current player
func get_best_move(board, player):
	var best_move = -1
	var best_value = -INF
	var possible_moves = get_possible_moves(board)
	for move in possible_moves:
		var new_board = apply_move(board, move, player)
		var board_value = minimax(new_board, 4, false, -INF, INF, player)  # Depth can be adjusted
		if board_value > best_value:
			best_value = board_value
			best_move = move
	if best_move == -1 and possible_moves.size() > 0:
		best_move = possible_moves[0]
	return best_move
