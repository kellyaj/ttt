require 'pry'
class Human

	def initialize(output = $stdout, input = $stdin)
		@input = input
		@output = output
	end

	def choose_move(available_spots)
		move_message
		user_input = @input.gets.chomp.to_i
		user_input if valid_move?(user_input, available_spots)
	end

	def valid_move?(user_input, available_spots)
		available_spots.include?(user_input)
	end

	def move_message
		@output.puts 'Choose a space to occupy.'
	end

end