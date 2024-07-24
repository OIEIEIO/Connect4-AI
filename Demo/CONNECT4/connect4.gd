extends Node2D

@export var cell_scene: PackedScene
var cells_node
var current_player: String = "red"  # 'red' for player, 'yellow' for AI
var board: Array = []  # Declare the board variable
var ai_type: String = "random"  # AI type to switch between different algorithms
var messages: Array = []  # Store messages to display

# Load Minimax script
var minimax_ai = load("res://addons/ai_algorithms/Scripts/Minimax/minimax.gd").new()

func _ready():
	print("Running _ready()")
	if cell_scene == null:
		cell_scene = load("res://Demo/CONNECT4/cell.tscn")
		if cell_scene == null:
			print("Error: Failed to load cell scene!")
			return
	else:
		print("Cell scene already loaded.")

	cells_node = $CenterContainer/Board/Cells
	if cells_node == null:
		print("Error: Cells node not found in _ready!")
		return
	else:
		print("Cells node found.")

	# Connecting signals correctly with Callable
	$UI/VBoxContainer/OptionButton1.connect("pressed", Callable(self, "_on_OptionButton1_pressed"))
	$UI/VBoxContainer/OptionButton2.connect("pressed", Callable(self, "_on_OptionButton2_pressed"))
	$UI/VBoxContainer/OptionButton3.connect("pressed", Callable(self, "_on_OptionButton3_pressed"))
	$UI/VBoxContainer/OptionButton4.connect("pressed", Callable(self, "_on_OptionButton4_pressed"))

	update_player_info("Current Player: " + current_player)
	init_board()
	create_board_visuals()
	print("Board visuals created.")

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var column = int((event.position.x - $CenterContainer/Board.position.x) / 100)
		if column >= 0 and column < 7 and current_player == "red":  # Only allow player to move when it's their turn
			player_move(column)

func init_board():
	board = []
	for i in range(6):
		var row = []
		for j in range(7):
			row.append("blue")  # Initialize with blue
		board.append(row)
	print("Board initialized: ", board)

func create_board_visuals():
	if cells_node == null:
		print("Error: Cells node not found in create_board_visuals!")
		return
	cells_node.queue_free()  # Ensure the node is cleared first
	cells_node = Node2D.new()
	$CenterContainer/Board.add_child(cells_node)

	var board_offset = Vector2(50, 50)
	for i in range(6):
		for j in range(7):
			if cell_scene == null:
				print("Error: Cell scene not found in create_board_visuals!")
				return
			var cell_instance = cell_scene.instantiate()
			cell_instance.position = board_offset + Vector2(j * 100, i * 100)
			cells_node.add_child(cell_instance)
			update_visual(i, j, board[i][j])
	print("Board visuals created")

func player_move(column):
	if make_move(column, current_player):
		var win_coords = check_win(current_player)
		if win_coords:
			print("Player " + str(current_player) + " wins!")
			messages.append("Player " + str(current_player) + " wins!")
			display_messages()
			await highlight_winning_discs(win_coords)
			await game_over()
			return
		elif board_full():
			print("The board is full. It's a draw!")
			messages.append("The board is full. It's a draw!")
			display_messages()
			await game_over()
			return
		else:
			switch_player()
			if current_player == "yellow":
				ai_move()

func ai_move():
	var column
	if ai_type == "random":
		column = randi() % 7
		while not can_make_move(board, column):
			column = randi() % 7
		messages.append("Random AI made move at column: " + str(column))
	elif ai_type == "minimax":
		column = minimax_ai.get_best_move(board, current_player)
		messages.append("Minimax AI made move at column: " + str(column))
	# Add more AI types as needed
	if can_make_move(board, column):
		make_move(column, current_player)
		display_messages()
	else:
		print("Error: Invalid column chosen by AI")
		messages.append("Error: Invalid column chosen by AI")
		display_messages()

	var win_coords = check_win(current_player)
	if win_coords:
		print("Player " + str(current_player) + " wins!")
		messages.append("Player " + str(current_player) + " wins!")
		display_messages()
		await highlight_winning_discs(win_coords)
		await game_over()
	elif board_full():
		print("The board is full. It's a draw!")
		messages.append("The board is full. It's a draw!")
		display_messages()
		await game_over()
	else:
		switch_player()

func make_move(column, player):
	if column < 0 or column >= 7:
		print("Error: Column out of bounds")
		messages.append("Error: Column out of bounds")
		display_messages()
		return false
	for i in range(5, -1, -1):
		if board[i][column] == "blue":
			board[i][column] = player
			update_visual(i, column, player)
			print("Move made at: ", i, column, " by ", player)
			return true
	print("Error: Column is full")
	messages.append("Error: Column is full")
	display_messages()
	return false

func update_visual(row, column, player):
	if cells_node == null:
		print("Error: Cells node not found in update_visual!")
		messages.append("Error: Cells node not found in update_visual!")
		display_messages()
		return
	var cell_instance = cells_node.get_child(row * 7 + column)
	if player == "red":
		cell_instance.texture = load("res://assets/red_disc.png")
	elif player == "yellow":
		cell_instance.texture = load("res://assets/yellow_disc.png")
	else:
		cell_instance.texture = load("res://assets/blue_disc.png")
	print("Updated visual at: ", row, column, " to ", player)

func switch_player():
	if current_player == "red":
		current_player = "yellow"
	else:
		current_player = "red"
	print("Switched player to: ", current_player)
	update_player_info("Current Player: " + current_player)

func check_win(player):
	# Check horizontal win
	for row in range(6):
		for col in range(4):
			if board[row][col] == player and board[row][col + 1] == player and board[row][col + 2] == player and board[row][col + 3] == player:
				return [[row, col], [row, col + 1], [row, col + 2], [row, col + 3]]
		# Check vertical win
	for col in range(7):
		for row in range(3):
			if board[row][col] == player and board[row + 1][col] == player and board[row + 2][col] == player and board[row + 3][col] == player:
				return [[row, col], [row + 1, col], [row + 2, col], [row + 3, col]]

	# Check diagonal win (bottom-left to top-right)
	for row in range(3):
		for col in range(4):
			if board[row][col] == player and board[row + 1][col + 1] == player and board[row + 2][col + 2] == player and board[row + 3][col + 3] == player:
				return [[row, col], [row + 1, col + 1], [row + 2, col + 2], [row + 3, col + 3]]

	# Check diagonal win (top-left to bottom-right)
	for row in range(3, 6):
		for col in range(4):
			if board[row][col] == player and board[row - 1][col + 1] == player and board[row - 2][col + 2] == player and board[row - 3][col + 3] == player:
				return [[row, col], [row - 1, col + 1], [row - 2, col + 2], [row - 3, col + 3]]

	return null

func board_full():
	for row in board:
		if "blue" in row:
			return false
	return true

func game_over():
	# Show game over message or dialog
	print("Game over. Restarting...")
	messages.append("Game over. Restarting...")
	display_messages()
	# Wait for a moment and restart the game
	await get_tree().create_timer(2.0).timeout
	init_board()
	create_board_visuals()
	current_player = "red"
	update_player_info("Current Player: " + current_player)
	messages.clear()
	display_messages()

func highlight_winning_discs(win_coords):
	for i in range(3):
		for coord in win_coords:
			var row = coord[0]
			var col = coord[1]
			var cell_instance = cells_node.get_child(row * 7 + col)
			if cell_instance:
				cell_instance.texture = load("res://assets/blue_disc.png")
		await get_tree().create_timer(0.5).timeout
		for coord in win_coords:
			var row = coord[0]
			var col = coord[1]
			var cell_instance = cells_node.get_child(row * 7 + col)
			if cell_instance:
				cell_instance.texture = load("res://assets/yellow_disc.png") if current_player == "yellow" else load("res://assets/red_disc.png")
		await get_tree().create_timer(0.5).timeout

func update_player_info(info):
	$UI/VBoxContainer/Label_PlayerInfo.text = info

func display_messages():
	var display_text = ""
	for message in messages:
		display_text += message + "\n"
	$UI/VBoxContainer2/Label_GameInfo.text = display_text

func can_make_move(board, col):
	return board[0][col] == "blue"

func _on_OptionButton1_pressed():
	print("Minimax AI selected")
	ai_type = "minimax"
	messages.append("Minimax AI selected")
	display_messages()

func _on_OptionButton2_pressed():
	print("Neural Net AI selected")
	ai_type = "neural_net"
	messages.append("Neural Net AI selected")
	display_messages()

func _on_OptionButton3_pressed():
	print("Q Learning AI selected")
	ai_type = "q_learning"
	messages.append("Q Learning AI selected")
	display_messages()

func _on_OptionButton4_pressed():
	print("Random AI selected")
	ai_type = "random"
	messages.append("Random AI selected")
	display_messages()
