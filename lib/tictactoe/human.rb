class Human

	def initialize(output = $stdout, input = $stdin)
		@input = input
		@output = output
		@board = nil
	end

	def choose_move(board)
		@board = board
		move_message
		display_available_moves(@board.available_spots)
		user_input = @input.gets.to_i
		valid_move?(user_input, @board.available_spots) ? user_input : invalid_message(@board.available_spots)
	end

	def valid_move?(user_input, available_spots)
		available_spots.include?(user_input)
	end

	def move_message
		@output.puts 'Choose a space to occupy.'
	end

	def display_available_moves(available_spots)
		@output.puts 'Available moves: ' + available_spots.to_s
	end

	def invalid_message(available_spots)
		@output.puts 'That is not a valid move. Try again.'
		choose_move(@board)
	end

end